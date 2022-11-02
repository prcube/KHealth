package TIPSDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import TIPSDTO.TipsDTO;

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
		String sql = "insert into tips values (tips_seq.nextval,?,0,?,sysdate,?,0)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			//pstat.setInt(1, dto.getTips_seq());
			pstat.setString(1, dto.getTips_title());
			//pstat.setString(3, dto.getTips_writer());
			pstat.setString(2, dto.getTips_contents());
			pstat.setInt(3, dto.getTips_view_count());
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
				dto.setTips_seq(rs.getInt("seq"));
				dto.setTips_title(rs.getString("title"));
				dto.setTips_writer(rs.getString("writer"));
				dto.setTips_contents(rs.getString("contents"));
				dto.setTips_write_date(rs.getTimestamp("write_date"));
				dto.setTips_view_count(rs.getInt("view_count"));
				dto.setTips_nickname("tips_nickname");
				return dto;
			}
		}
	}

}
