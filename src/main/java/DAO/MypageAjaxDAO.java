package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.QnaCommentsDTO;
import DTO.QnaDTO;

public class MypageAjaxDAO {
	private static MypageAjaxDAO instance = null;

	public static MypageAjaxDAO getInstance() {
		if (instance == null) {
			instance = new MypageAjaxDAO();
		}
		return instance;
	}

	java.util.Date starttijd = new java.util.Date();

	private MypageAjaxDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//mypage comments 정보 불러오기
	public List<QnaCommentsDTO> selectByRange(String loginID, int start, int end) throws Exception{
		String sql = "select * from (select qnaComments.*, row_number() over(order by qnaCms_seq desc) rn from qnaComments) where qnaCms_writer = ?";

		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, loginID);
			//pstat.setInt(2, start);
			//pstat.setInt(3, end);

			try(ResultSet rs = pstat.executeQuery()){
				List<QnaCommentsDTO> list = new ArrayList<>();
				while(rs.next()) {
					QnaCommentsDTO dto = new QnaCommentsDTO();
					dto.setQnaCms_seq(rs.getInt("qnaCms_seq"));
					dto.setQnaCms_parent_seq(rs.getInt("qnaCms_parent_seq"));
					dto.setQnaCms_writer(rs.getString("qnaCms_writer"));
					dto.setQnaCms_contents(rs.getString("qnaCms_contents"));
					dto.setQnaCms_nincname(rs.getString("qnaCms_nickname"));
					dto.setQnaCms_write_date(rs.getTimestamp("qnaCms_write_date"));
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	//mypage board 정보 불러오기
	public List<QnaDTO> selectByRange2(String loginID, int start, int end) throws Exception{
		String sql = "select * from (select qna.*, row_number() over(order by qna_seq desc) rn from qna) where qna_writer = ?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, loginID);
			//pstat.setInt(2, start);
			//pstat.setInt(3, end);

			try(ResultSet rs = pstat.executeQuery()){
				List<QnaDTO> list = new ArrayList<>();
				while(rs.next()) {
					QnaDTO dto = new QnaDTO();
					dto.setQna_seq(rs.getInt("qna_seq"));
					dto.setQna_title(rs.getString("qna_title"));
					dto.setQna_writer(rs.getString("qna_writer"));
					dto.setQna_contents(rs.getString("qna_contents"));
					dto.setQna_nickname(rs.getString("qna_nickname"));
					dto.setQna_write_date(rs.getTimestamp("qna_write_date"));
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	//네비 관련 코드
	public int getRecordCount() throws Exception{
		String sql = "select count(*) from qnaComments";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery()){
			rs.next();
			return rs.getInt(1); //count니까 1행1열에 전체 숫자가 있을거야
		}
	}
	
	//네비 관련 코드
	public String getPageNavi(int currentPage) throws Exception{

		int recordTotalCount = this.getRecordCount(); //총 게시글의 수
		int recordCountPerPage = 10; //한 페이지당 보여줄 게시물 수
		int naviCountPerPage = 10; // 한번에 보여질 네비게이터의 수

		int pageTotalCount = 0;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage -1;
		
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();

		if(needPrev) {
			sb.append("<a href='/mypageComments.ajax?cpage="+(startNavi-1)+"'> < </a>");
		}

		for(int i=startNavi; i<=endNavi; i++) {
			sb.append("<a href='/mypageComments.ajax?cpage="+i+"'>" + i + "</a> ");
		}

		if(needNext) {
			sb.append("<a href='/mypageComments.ajax?cpage="+(endNavi+1)+"'> > </a>");
		}

		return sb.toString();
	}

}
	