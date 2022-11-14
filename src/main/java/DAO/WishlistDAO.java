package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.ProductDTO;
import DTO.WishlistDTO;

public class WishlistDAO {
	private static WishlistDAO instance;

	synchronized public static WishlistDAO getInstance() throws Exception{

		if (instance == null) {
			instance = new WishlistDAO();
		}
		return instance;
	}

	private WishlistDAO() {}


	private Connection getConnection() throws Exception{

		// JDNI 기법 적용 
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int getnextval() throws Exception{

		String sql = "select wishlist_seq.nextval from dual";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){ 


			try(ResultSet rs =pstat.executeQuery();){

				rs.next();

				int seq = rs.getInt("nextval");
				return seq;
			}

		}

	}
	
	public int insert(int wishlist_seq, String product_name, int prodcut_seq, String product_price, int amount, String id, String oriName) throws Exception {
		String sql = "insert into wishlist values(?,?,?,?,?,?,?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, wishlist_seq);
			pstat.setString(2, product_name);
			pstat.setInt(3, prodcut_seq);
			pstat.setString(4, product_price);
			pstat.setInt(5, amount);
			pstat.setString(6, id);
			pstat.setString(7, oriName);
			int result = pstat.executeUpdate();
			con.setAutoCommit(false);
			con.close();
			return result;
		}
	}
	
	public int addupdate(int amount, String product_name, String id) throws Exception {
		String sql = "update wishlist set product_wish_count=product_wish_count+? where product_name=? and product_wish_user=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setInt(1, amount);
			pstat.setString(2, product_name);
			pstat.setString(3, id);
			
			int result = pstat.executeUpdate();
			con.setAutoCommit(false);
			con.close();
			return result;
		}
	}
	
	public List<WishlistDTO> selectByRange(int start, int end) throws Exception{

		String sql = "select * from (select wishlist.*, row_number() over(order by wishlist_seq desc) rn from product) where rn between ? and ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			List<WishlistDTO> result = new ArrayList<>();
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs =pstat.executeQuery();){	

				while(rs.next()) {

					int wishlist_seq = rs.getInt("wishlist_seq");

					String product_name =rs.getString("product_name");	
					int product_seq = rs.getInt("prodcut_seq");
					String product_price = rs.getString("product_price");
					int product_wish_count = rs.getInt("product_wish_count");
					String product_wish_user = rs.getString("product_wish_user");
					String product_image_oriName = rs.getString("prodcut_image_oriname");
					WishlistDTO dto = new WishlistDTO(wishlist_seq, product_name, product_seq, product_price, product_wish_count,product_wish_user, product_image_oriName);
					result.add(dto);

				}
				return result;
			}

		}
	}
	
	public List<WishlistDTO> selectById(String id) throws Exception{

		String sql = "select * from wishlist where product_wish_user = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			List<WishlistDTO> result = new ArrayList<>();
			pstat.setString(1, id);

			try(ResultSet rs =pstat.executeQuery();){	

				while(rs.next()) {

					int wishlist_seq = rs.getInt("wishlist_seq");

					String product_name =rs.getString("product_name");
					int product_seq = rs.getInt("product_seq");
					String product_price = rs.getString("product_price");
					int product_wish_count = rs.getInt("product_wish_count");
					String product_wish_user = rs.getString("product_wish_user");
					String product_image_oriName = rs.getString("product_image_oriname");
					
					WishlistDTO dto = new WishlistDTO(wishlist_seq, product_name, product_seq, product_price, product_wish_count,product_wish_user, product_image_oriName);
					result.add(dto);

				}
				return result;
			}

		}
	}
	
	public boolean isProductExist(String id, String product_name) throws Exception {
		String sql = "select * from wishlist where product_wish_user=? and product_name=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, product_name);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	
	public int getRecordCount() throws Exception{
		String sql = "select count(*) from product";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public int deleteById(String id) throws Exception{
		String sql = "delete from wishlist where product_wish_user=?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
		
	}
	
	public void updateByWishlist(List<String> amountarr,List<String> namearr,String id) throws Exception{
		String sql = "update wishlist set product_wish_count=? where product_wish_user=? and product_name=?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			
			for(int i=0;i<amountarr.size();i++) {
				
				pstat.setString(1, amountarr.get(i));
				pstat.setString(2, id);
				pstat.setString(3, namearr.get(i));
				pstat.executeUpdate();
				con.commit();
			}

			con.close();
			
			
			
		}
	}
	
	public String getPageNavi(int currentPage) throws Exception{

		int recordTotalCount = this.getRecordCount(); // board table에 글이 총 144개 있다고 가정

		int recordCountPerPage = 9; // 게시판 한 페이지당 10개의 글씩 보여주기로 설정

		int naviCountPerPage = 10; // 게시판 하단의 Page Navigator 가 한번에 몇 개씩 보여질지 지설정

		int pageTotalCount = 0;  

		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / recordCountPerPage)+1;  //게시글의 개수 / 한 페이지당 보여줄 게시글 +1 = 전체 페이지의 개수

		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		//		int currentPage=7   //현재 내가 있는 페이지를 7페이지로 가정
		// 7 : 1~10
		// 15 : 11~20
		// 28 : 21~30 ...  보여지는 페이지는 이런 구조일 테니까

		if(currentPage < 1) {   
			currentPage = 1;                          //currentPage 값 검사
		}else if(currentPage > pageTotalCount) {   
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage +1 ;  //현재 페이지에 따라 하단 navi에 몇부터 몇까지 보여줘야하는지를 새악	
		int endNavi = startNavi + naviCountPerPage-1;

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;                     //endNavi 값 검사
		}


		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();



		if(needPrev) {
			sb.append("<a href='/list.wish?cpage="+(startNavi-1)+"'><</a>");
		}
		for(int i =startNavi; i<=endNavi; i++) {
			sb.append("<a href='/list.wish?cpage="+i+"'>" + i + "</a>");
			sb.append(" ");	
		}

		if(needNext) {
			sb.append("<a href='/list.wish?cpage="+(endNavi+1)+"'>></a>");
		}
		return sb.toString();
	}
}
