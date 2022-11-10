package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.TipsDTO;


public class TipsDAO {

	private static TipsDAO instance;

	synchronized public static TipsDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new TipsDAO();
		}
		return instance;
	}

	// DBCP 기능
	private TipsDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext(); //
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); // 찾아달라는 명령어 lookup ,java:comp/env/밑에 있는
																				// jdbc/oracle을 찾아달라는것
		return ds.getConnection();
	}
	//insert
	public int insert(TipsDTO dto) throws Exception {
		String sql = "insert into tips values (tips_seq.nextval,?,?,?,sysdate,?,0)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			//pstat.setInt(1, dto.getTips_seq());
			pstat.setString(1, dto.getTips_title());
			pstat.setString(2, dto.getTips_writer());
			pstat.setString(3, dto.getTips_contents());
			pstat.setInt(4, dto.getTips_view_count());
			//pstat.setString(5, dto.getTips_nickname());
			int result = pstat.executeUpdate();
			con.commit();
			con.close();
			return result;

		}
	}
	//select
	public List<TipsDTO> selectAll() throws Exception {
		String sql = "select * from tips order by tips_seq desc";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			ResultSet rs = pstat.executeQuery();
			List<TipsDTO> list = new ArrayList<>();
			while (rs.next()) {
				TipsDTO dto = new TipsDTO();
				dto.setTips_seq(rs.getInt("tips_seq"));
				dto.setTips_title(rs.getString("tips_title"));
				dto.setTips_writer(rs.getString("tips_writer"));
				dto.setTips_contents(rs.getString("tips_contents"));
				dto.setTips_write_date(rs.getTimestamp("tips_write_date"));
				dto.setTips_view_count(rs.getInt("tips_view_count"));
				dto.setTips_nickname("tips_nickname");
				list.add(dto);
			}
			return list;
		}
	}
	
	public TipsDTO detail(int tips_seq) throws Exception {
		String sql = "select * from tips where tips_seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, tips_seq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				TipsDTO dto = new TipsDTO();
				dto.setTips_seq(rs.getInt("tips_seq"));
				dto.setTips_title(rs.getString("tips_title"));
				dto.setTips_writer(rs.getString("tips_writer"));
				dto.setTips_contents(rs.getString("tips_contents"));
				dto.setTips_write_date(rs.getTimestamp("tips_write_date"));
				dto.setTips_view_count(rs.getInt("tips_view_count"));
				dto.setTips_nickname("tips_nickname");
				con.setAutoCommit(false);
				return dto;
			}
		}
	}
	
	public int delete(int tips_seq)throws Exception {
		String sql = "delete from tips where tips_seq=?";
		try(Connection con = this.getConnection(); 
			PreparedStatement pstat =con.prepareStatement(sql);){
			
			pstat.setInt(1, tips_seq);
			int result = pstat.executeUpdate();
			con.commit();
			con.close();
			return result;
		}
	}
	
	public int update(String tips_title, String tips_contents, int tips_seq)throws Exception{
		String sql = "update tips set tips_title=?, tips_contents=? where tips_seq =?";
		try(Connection con = this.getConnection();PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, tips_title);
			pstat.setString(2, tips_contents);
			pstat.setInt(3, tips_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int addViewCount(int tips_seq) throws Exception {

		String sql = "update tips set tips_view_count = tips_view_count + 1 where tips_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, tips_seq);
			int result = pstat.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			return result;

		}

	}
	
	public int getnextval() throws Exception {

		String sql = "select tips_seq.nextval from dual";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
	// 개시글의 개수를 반환하는 코드
		public int getRecordCount() throws Exception {
			String sql = "select count(*) from tips";
			try (Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					ResultSet rs = pstat.executeQuery()) {
				rs.next();
				return rs.getInt(1);
			}
		}
		public String getPageNavi(int currentPage) {

			// 밑에 얘네들은 데이터 테이블에 넣고 관리해야한다.
			int recordTotalCount = 30; // 원래는 sql에서 데이터를 가져와야하는데 일단은 borad에 144개의 글이 있다고 가정
			int recordCountPerPage = 10; // 게시판 한 페이지당 한개의 페이지에 10개의 글을 보여주기로 설정
			int naviCountPerPage = 3; // 게시판 하단의 Page Navigator 가 한번에 몇개씩 보여질지 설정

			// 전체 페이지의 개수 = 게시글의 개수 / 한페이지당 보여줄 게시글 +1
			int pageTotalCount = 0;
			if (recordTotalCount % recordCountPerPage > 0) {
				pageTotalCount = recordTotalCount / recordCountPerPage + 1;
			} else {
				pageTotalCount = recordTotalCount / recordCountPerPage;
			}
			// 140 /10 =14인데 +1 해서 15가 되니까 나머지가 있을때만 +1 한다는 if문
			// int pageTotalCount= (recordTotalCount+9) / recordCountPerPage; = if문을 안쓰고
			// 사용하는 문법 한페이지에 보여줄 글이 10개일때
			// int pageTotalCount= (recordTotalCount+(recordCountPerPage-1)) /
			// recordCountPerPage;

			// int currentPage = 1;

			if (currentPage < 1) {
				currentPage = 1;
			} else if (currentPage > pageTotalCount) {
				currentPage = pageTotalCount;
			}
			// 7: 1~10
			// 15: 11~20
			// 28: 21~30

			// 10으로 나누고 10을 곱하면 1의자리 숫자가 0이 된다. 단 끝이 0인 숫자가 오면 안되기 때문에 currentPage에 -1 해준다.
			// ex) 15/10 = 1 , 1*10 = 10
			int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
			int endNavi = startNavi + naviCountPerPage - 1;

			if (endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}

//			System.out.println("현재 페이지 : " + currentPage);
//			System.out.println("네비게이터 시작 : "+startNavi);
//			System.out.println("네비게이터 끝 : " + endNavi);

			// 페이지에서 다음페이지나 전 페이지 이동
			boolean needPrev = true;
			boolean needNext = true;

			// 시작 나브의 시작이 1이면 false 값
			// 앤드 나브의 값이 마지막이면 false 값
			if (startNavi == 1) {
				needPrev = false;
			}
			if (endNavi == pageTotalCount) {
				needNext = false;
			}

			// StringBuilder 는 문자열을 연결해 주는 클래스이다.
			StringBuilder sb = new StringBuilder();

			// 이전의 나브값이 true이면 < 출력
			if (needPrev) {
				sb.append("<a href='/list.tips?cpage=" + (startNavi - 1) + "'><</a> ");
			}

			for (int i = startNavi; i <= endNavi; i++) {
				sb.append("<a href='/list.tips?cpage=" + i + "'>" + i + "</a> ");
			}

			// 다음의 나브값이 true이면 > 출력
			if (needNext) {
				sb.append("<a href='/list.tips?cpage=" + (endNavi + 1) + "'>></a> ");
			}

			return sb.toString();

		}


	
	public List<TipsDTO> selectByRange(int start, int end) throws Exception {
		String sql = "select * from(select tips.*, row_number() over(order by tips_seq desc)as rn from tips) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			ResultSet rs = pstat.executeQuery();
			List<TipsDTO> list = new ArrayList<>();
			while (rs.next()) {
				TipsDTO dto1 = new TipsDTO();
				dto1.setTips_seq(rs.getInt("tips_seq"));
				dto1.setTips_title(rs.getString("tips_title"));
				dto1.setTips_writer(rs.getString("tips_writer"));
				dto1.setTips_contents(rs.getString("tips_contents"));
				dto1.setTips_write_date(rs.getTimestamp("tips_write_date"));
				dto1.setTips_view_count(rs.getInt("tips_view_count"));
				dto1.setTips_nickname(rs.getString("tips_nickname"));
				list.add(dto1);
			}
			return list;
		}
	}
	   

}
