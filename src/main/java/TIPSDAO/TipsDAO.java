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

	public int insert(TipsDTO dto) throws Exception {
		String sql = "insert into tips values (?,?,?,?,sysdate,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, dto.getTips_seq());
			pstat.setString(2, dto.getTips_title());
			pstat.setString(3, dto.getTips_writer());
			pstat.setString(4, dto.getTips_contents());
			pstat.setInt(5, dto.getTips_view_count());
			pstat.setString(6, dto.getTips_nickname());
			int result = pstat.executeUpdate();
			con.commit();
			con.close();
			return result;

		}
	}
	
	public List<TipsDTO> selectAll() throws Exception {
		String sql = "select * from tips order by seq desc";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			ResultSet rs = pstat.executeQuery();
			List<TipsDTO> list = new ArrayList<>();
			while (rs.next()) {
				TipsDTO dto = new TipsDTO();
				dto.setTips_seq(rs.getInt("seq"));
				dto.setTips_title(rs.getString("title"));
				dto.setTips_writer(rs.getString("writer"));
				dto.setTips_contents(rs.getString("contents"));
				dto.setTips_write_date(rs.getTimestamp("write_date"));
				dto.setTips_view_count(rs.getInt("view_count"));
				list.add(dto);
			}
			return list;
		}
	}
	
	

}
