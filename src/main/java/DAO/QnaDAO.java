package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.QnaDTO;

public class QnaDAO {
	//   싱글턴
	private static QnaDAO instance = null;

	public static QnaDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new QnaDAO();

		}
		return instance;
	}
	private QnaDAO() {}


	private Connection getConnection() throws Exception{


		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int write(QnaDTO dto) throws Exception {
		String sql = "insert into qna values (qna_seq.nextval,?,?,?,sysdate,?,?,?)";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1,dto.getQna_title());
			pstat.setString(2, dto.getQna_writer());
			pstat.setString(3, dto.getQna_contents());
			pstat.setInt(4,dto.getQna_view_count());
			pstat.setString(5, dto.getQna_nickname());   
			pstat.setInt(6, dto.getQna_thumbsup());
			int result = pstat.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;

		}
	}public List<QnaDTO> selectAll() throws Exception {
		String sql = "select * from qna order by qna_seq desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			List<QnaDTO> list = new ArrayList<>();
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_seq(rs.getInt("qna_seq"));
				dto.setQna_title(rs.getString("qna_title"));
				dto.setQna_writer(rs.getString("qna_writer"));
				dto.setQna_contents(rs.getString("qna_contents"));
				dto.setQna_write_date(rs.getTimestamp("qna_write_date"));
				dto.setQna_view_count(rs.getInt("qna_view_count"));
				dto.setQna_nickname(rs.getString("qna_nickname"));
				dto.setQna_thumbsup(rs.getInt("qna_thumbsup"));
				list.add(dto);
			}
			return list;
		}
	}public QnaDTO selectBySeq(int qna_seq) throws Exception {
		String sql  ="select * from qna where qna_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, qna_seq);
			try(ResultSet rs = pstat.executeQuery();) {
				rs.next();
				String qna_title = rs.getString("qna_title");
				String qna_writer = rs.getString("qna_writer");
				String qna_contents = rs.getString("qna_contents");
				Timestamp qna_write_date = rs.getTimestamp("qna_write_date");
				int qna_view_count = rs.getInt("qna_view_count");
				String qna_nickname = rs.getString("qna_nickname");
				int qna_thumbsup = rs.getInt("qna_thumbsup");
				QnaDTO dto = new QnaDTO(qna_seq, qna_title, qna_writer,qna_contents,qna_write_date,qna_view_count,qna_nickname,0,qna_thumbsup,0); 

				return dto;
			}
		}
	}public int deleteBySeq(int qna_seq)throws Exception {
		String sql = "delete from qna where qna_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,qna_seq);

			int result = pstat.executeUpdate();
			con.setAutoCommit(false);
			con.commit();

			return result;
		}
	}public int updateBySeq(String qna_title , String qna_contents, int qna_seq) throws Exception {
		String sql = "update qna set qna_title=?, qna_contents = ? where qna_seq =?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, qna_title);
			pstat.setString(2, qna_contents);
			pstat.setInt(3, qna_seq);
			int result = pstat.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			return result;
		}
	}public int addViewCount(int qna_seq) throws Exception {
		String sql = "update qna set qna_view_count = qna_view_count+1 where qna_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, qna_seq);
			int result = pstat.executeUpdate();
			con.setAutoCommit(false);
			con.commit();

			return result;

		}
	}//게시글의 개수를 반환하는 코드
	public int getRecordCount() throws Exception {
		String sql = "select count(*) from qna";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			rs.next();
			return rs.getInt(1);
		}
	}
	public String getPageNavi(int currentPage) throws Exception{

		//      총 몇개의 글이 있는지 선택
		int recordTotalCount = this.getRecordCount(); //board 테이블에 총 144개의 글이 있다고 가정
		int recordCountPerPage = 10; //한페이지 당 10개 볼수있다.
		int naviCountPerPage = 10; //게시판 하단의 page Navigator 가 한번에 몇개씩 보여질지 설정

		int pageTotalCount = 0;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
			// 게시글의 개수/한페이지당 보여줄 게시글 +1 = 전체페이지의 개수
		}else {
			pageTotalCount = (recordTotalCount / recordCountPerPage);
		}

		//      int currentPage = 1;
		// 7페이지에있다. : 1~10
		//15페이지에있다. : 11~20
		//28페이지에 있다. : 21~30

		//20페이지에 있다. : 11~20
		if(currentPage <1) {
			currentPage = 1;

		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1; //네비 시작점.
		int endNavi = startNavi + naviCountPerPage -1; //네비 끝나는지점

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		//      System.out.println("현재페이지 : " + currentPage);
		//      System.out.println("네비게이터 시작 : "+ startNavi);
		//      System.out.println("네비게이터 끝 : " + endNavi);

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();
		//      문자열 덧셈역활을해줌.(연결해줌.)


		if(needPrev) {
			//         왼쪽버튼 누르면 현재페이지 -1 페이지로
			sb.append("<a href='/list.qna?cpage="+(startNavi-1)+"'><</a>");
		}


		for(int i = startNavi; i<=endNavi; i++) {
			//         앵커태그를 걸어둬서 이동시킴.
			sb.append("<a href='/list.qna?cpage="+i+"'>"+i+"</a> ");
		}
		//      오른쪽 버튼 누르면 현재페이지 +1 페이지로
		if(needNext) {
			sb.append("<a href = '/list.qna?cpage="+(endNavi+1)+"'>></a> ");
		}

		return  sb.toString();


	}

	public List<QnaDTO> selectByRange(int start , int end) throws Exception {
		String sql = "select *from (select qna.*,row_number()over(order by qna_seq desc)as rn from qna) where rn between ? and ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(ResultSet rs = pstat.executeQuery()){
				List<QnaDTO> list = new ArrayList<>();

				while(rs.next()) {
					QnaDTO dto = new QnaDTO();
					dto.setQna_seq(rs.getInt("qna_seq"));
					dto.setQna_title(rs.getString("qna_title"));
					dto.setQna_writer(rs.getString("qna_writer"));
					dto.setQna_contents(rs.getString("qna_contents"));
					dto.setQna_write_date(rs.getTimestamp("qna_write_date"));
					dto.setQna_view_count(rs.getInt("qna_view_count"));
					dto.setQna_nickname(rs.getString("qna_nickname"));
					dto.setQna_thumbsup(rs.getInt("qna_thumbsup"));
					//               rn셋팅
					dto.setRn(rs.getInt("rn"));
					list.add(dto);
				}
				return list;


			}

		}
		
//		public QnaDTO selectByRange(int seq) throws Exception {
//			String sql = "select * from qna where qna_seq = ?";
//
//			try(Connection con = this.getConnection();
//				PreparedStatement pstat = con.prepareStatement(sql)){
//				pstat.setInt(1, seq);
//
//				try(ResultSet rs = pstat.executeQuery()){
//
//					rs.next();
//					QnaDTO dto = new QnaDTO();
//					dto.setQna_seq(rs.getInt("qna_seq"));
//					dto.setQna_title(rs.getString("qna_title"));
//					dto.setQna_writer(rs.getString("qna_writer"));
//					dto.setQna_contents(rs.getString("qna_contents"));
//					dto.setQna_write_date(rs.getTimestamp("qna_write_date"));
//					dto.setQna_view_count(rs.getInt("qna_view_count"));
//					dto.setQna_nickname(rs.getString("qna_nickname"));
//					dto.setQna_thumbsup(rs.getInt("qna_thumbsup"));
//						//               rn셋팅
//					dto.setRn(rs.getInt("rn"));
//					return dto;
//				}
//			}
//		}
			
	}public int getnextval() throws Exception {
		//      다음 시퀀스값을 가져온다.
		String sql  = "select qna_seq.nextval from dual";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			ResultSet rs = pstat.executeQuery();
			rs.next();
			int qna_seq = rs.getInt("nextval");
			con.commit();
			return qna_seq;
		}

	}public int addthumbsupCount(int qna_seq) throws Exception {

		String sql = "update qna set qna_thumbsup = qna_thumbsup +1 where qna_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, qna_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}public List<QnaDTO> replycount(int start , int end) throws Exception {
		String sql = "select * from \r\n"
				+ "(select \r\n"
				+ "    qna.*, \r\n"
				+ "    row_number() over(order by qna_seq desc) rn, \r\n"
				+ "    (select count(*) from qnacomments where qnacms_parent_seq=qna_seq) replycount\r\n"
				+ "from qna) \r\n"
				+ "where rn between ? and ?";


		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			ResultSet rs = pstat.executeQuery();
			List<QnaDTO> list1 = new ArrayList<>();
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_seq(rs.getInt("qna_seq"));
				dto.setQna_title(rs.getString("qna_title"));
				dto.setQna_writer(rs.getString("qna_writer"));
				dto.setQna_contents(rs.getString("qna_contents"));
				dto.setQna_write_date(rs.getTimestamp("qna_write_date"));
				dto.setQna_view_count(rs.getInt("qna_view_count"));
				dto.setQna_nickname(rs.getString("qna_nickname"));
				dto.setQna_thumbsup(rs.getInt("qna_thumbsup"));
				dto.setNumberOfComment(rs.getInt("replycount"));
				list1.add(dto);



				// System.out.println(dto.getQna_seq());
				// System.out.println(dto.getQna_title());
				
			}
			return list1;
		}
	}

	public List<QnaDTO> search(String searchTitle,String loginNickname) throws Exception {
		String sql = "select * from qna where qna_title like ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%"+searchTitle+"%");
			try(ResultSet rs = pstat.executeQuery();){
				List<QnaDTO> list = new ArrayList<>();
				while(rs.next()) {
					QnaDTO dto = new QnaDTO();
					dto.setQna_seq(rs.getInt("qna_seq"));
					dto.setQna_title(rs.getString("qna_title"));
					dto.setQna_writer(rs.getString("qna_writer"));
					dto.setQna_contents(rs.getString("qna_contents"));
					dto.setQna_write_date(rs.getTimestamp("qna_write_date"));
					dto.setQna_view_count(rs.getInt("qna_view_count"));
					dto.setQna_nickname(loginNickname);
					System.out.println(rs.getString("qna_nickname"));
					list.add(dto);
				}
				return list;
				}
		}
	}
}

//   public List<QnaDTO> search(String title) throws Exception {
//      String sql = "select * from qna where qna_title like ?";
//      try(Connection con = this.getConnection();
//            PreparedStatement pstat = con.prepareStatement(sql);){
//         pstat.setString(1, "%"+qna_title+"%");
//         try(ResultSet rs = pstat.executeQuery();){
//            List<QnaDTO> list = new ArrayList<>();
//            while(rs.next()) {
//               QnaDTO dto = new QnaDTO();
//               dto.setQna_seq(rs.getInt("qna_seq"));
//               dto.setQna_title(rs.getString("qna_title"));
//               dto.setQna_writer(rs.getString("qna_writer"));
//               dto.setQna_contents(rs.getString("qna_contents"));
//               dto.setQna_write_date(rs.getTimestamp("qna_write_date"));
//               dto.setQna_view_count(rs.getInt("qna_view_count"));
//               dto.setQna_nickname(rs.getString("qna_nickname"));
//               list.add(dto);
//
//            }
//            return list;
//         }
//      }
//   }




