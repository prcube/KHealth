package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.MypageDTO;


public class MypageDAO {
	private static MypageDAO instance;

	synchronized public static MypageDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new MypageDAO();
		}
		return instance;
	}

	private MypageDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public List<MypageDTO> selectAll(String loginID) throws Exception {
		String sql = "select * from buy_record where buy_rcd_userid = ? order by 1 desc";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, loginID);
			ResultSet rs = pstat.executeQuery();
			List<MypageDTO> list = new ArrayList<>();
			while (rs.next()) {
				MypageDTO dto = new MypageDTO();
				dto.setSeq(rs.getInt("buy_rcd_seq"));
				dto.setProduct_name(rs.getString("buy_rcd_name"));
				dto.setId(rs.getString("buy_rcd_userid"));
				dto.setNickname(rs.getString("buy_rcd_usercharacter"));
				dto.setAmount(rs.getInt("buy_rcd_amount"));
				list.add(dto);
			}
			return list;
		}

	}

	public int getRecordCount() throws Exception {
		String sql = "select count(*) from buy_record";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()) {
			rs.next();
			return rs.getInt(1);
		}
	}

	public String getPageNavi(int currentPage) throws Exception {

		int recordTotalCount = this.getRecordCount(); // board table 에 144개 글이 있다고 가정
		int recordCountPerpage = 5; // 게시판당 한 페이지 10 개씩 글 보여주는걸 설정
		int naviCountPerpage = 10; // 게시판 하단의 네비게이터가 한 번에 몇개 보여질지 설정

		int pageTotalCount = 0;

		if (recordTotalCount % recordCountPerpage > 0) {
			pageTotalCount = (recordTotalCount / recordCountPerpage) + 1;
//			게시글의 개수 / 한 페이지당 보여줄 게시글 +1 = 전체 페이지의 개수
		} else {
			pageTotalCount = recordTotalCount / recordCountPerpage;
		}

		if (currentPage < 1) {
			currentPage = 1; // 1보다 작은값으로 접근시 1로 강제 적용
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount; // 최대 페이지 값보다 높은 값으로 접근시 강제로 최대값으로 적용
		}

		int startNavi = (currentPage - 1) / naviCountPerpage * naviCountPerpage + 1;
		int endNavi = startNavi + naviCountPerpage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();
		if (needPrev) {
			sb.append("<a href= '/orderhistory.mypage?cpage=" + (startNavi - 1) + "'> <</a> ");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href= '/orderhistory.mypage?cpage=" + i + "'> " + i + " ");
		}

		if (needNext) {
			sb.append("<a href= '/orderhistory.mypage?cpage=" + (endNavi + 1) + "'>></a> ");
		}

		return sb.toString();
	}

	public List<MypageDTO> selectByRange(int start, int end, String id) throws Exception {
		String sql = "select * from (select buy_record.*, row_number() over(order by buy_rcd_seq desc) rn from buy_record) where (rn between ? and ?) and buy_rcd_userid=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			pstat.setString(3, id);
			try (ResultSet rs = pstat.executeQuery();) {
				List<MypageDTO> list = new ArrayList<>();
				while (rs.next()) {
					MypageDTO dto = new MypageDTO();
					dto.setSeq(rs.getInt("buy_rcd_seq"));
					dto.setProduct_name(rs.getString("buy_rcd_name"));
					dto.setId(rs.getString("buy_rcd_userid"));
					dto.setNickname(rs.getString("buy_rcd_usercharacter"));
					dto.setAmount(rs.getInt("buy_rcd_amount"));
					list.add(dto);
				}
				return list;
			}
		}
	}

	public int getnextval() throws Exception {
		String sql = "select buy_record_seq.nextval from dual";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				int seq = rs.getInt("nextval");
				return seq;
			}

		}

	}
	

	
}