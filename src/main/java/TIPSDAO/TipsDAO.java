package TIPSDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

}
