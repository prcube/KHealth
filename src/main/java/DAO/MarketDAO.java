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


public class MarketDAO {
	private static MarketDAO instance;

	synchronized public static MarketDAO getInstance() throws Exception{

		if (instance == null) {
			instance = new MarketDAO();
		}
		return instance;
	}

	private MarketDAO() {}


	private Connection getConnection() throws Exception{

		// JDNI 기법 적용 
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();


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
	
	public String getPageNavi(int currentPage) throws Exception{

		int recordTotalCount = this.getRecordCount(); // board table에 글이 총 144개 있다고 가정

		int recordCountPerPage = 10; // 게시판 한 페이지당 10개의 글씩 보여주기로 설정

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
			sb.append("<a href='/list.market?cpage="+(startNavi-1)+"'><</a>");
		}
		for(int i =startNavi; i<=endNavi; i++) {
			sb.append("<a href='/list.market?cpage="+i+"'>" + i + "</a>");
			sb.append(" ");	
		}

		if(needNext) {
			sb.append("<a href='/list.market?cpage="+(endNavi+1)+"'>></a>");
		}
		return sb.toString();
	}
	
	public List<ProductDTO> selectByRange(int start, int end) throws Exception{

		String sql = "select * from (select product.*, row_number() over(order by product_seq desc) rn from product) where rn between ? and ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			List<ProductDTO> result = new ArrayList<>();
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs =pstat.executeQuery();){

				while(rs.next()) {

					int product_seq = rs.getInt("seq");

					String product_name =rs.getString("product_name");	
					String product_price = rs.getString("product_price");
					int product_count = rs.getInt("product_count");
					
					ProductDTO dto2 = new ProductDTO(product_seq, product_name, product_price, product_count);
					result.add(dto2);

				}
				return result;
			}

		}
	}
}
