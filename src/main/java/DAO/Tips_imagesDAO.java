package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.Tips_imagesDTO;

public class Tips_imagesDAO {

	private static Tips_imagesDAO instance;

	synchronized public static Tips_imagesDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new Tips_imagesDAO();
		}
		return instance;
	}

	// DBCP 기능
	private Tips_imagesDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext(); //
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); // 찾아달라는 명령어 lookup ,java:comp/env/밑에 있는
																				// jdbc/oracle을 찾아달라는것
		return ds.getConnection();
	}

	// tips_seq 랑 같은 숫자로 올라가게 하는 코드
	public int getnextval() throws Exception {

		String sql = "select tips_seq.nextval from dual";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();

				int seq = rs.getInt("nextval");
				return seq;
			}

		}

	}

	public int insert(Tips_imagesDTO dto) throws Exception {
		String sql = "insert into tips_images values(?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, dto.getImages_seq());
			pstat.setString(2, dto.getOriName());
			pstat.setString(3, dto.getSysName());
			pstat.setInt(4, dto.getParent_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public List<Tips_imagesDTO> selectAll() throws Exception {

		String sql = "select * from tips_images";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			List<Tips_imagesDTO> result = new ArrayList<>();

			try (ResultSet rs = pstat.executeQuery();) {

				while (rs.next()) {

					int images_seq = rs.getInt("images_seq");
					String oriName = rs.getString("oriname");
					String sysName = rs.getString("sysname");
					int parent_seq = rs.getInt("parent_seq");

					Tips_imagesDTO dto = new Tips_imagesDTO(images_seq, oriName, sysName, parent_seq);
					result.add(dto);

				}
				return result;
			}

		}
	}

	public int getimage(int tips_seq) throws Exception {

		String sql = "select * from tips_images where parent_seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, tips_seq);

			try (ResultSet rs = pstat.executeQuery();) {

				while (rs.next()) {

					String oriName = rs.getString("oriname");

				}
				int result = pstat.executeUpdate();
				return result;
			}

		}
	}

	public String getImageOriName(int tips_seq) throws Exception {

		String sql = "select * from tips_images where parent_seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, tips_seq);
			System.out.println(tips_seq);
			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();

				String oriName = rs.getString("ORINAME");

				int result = pstat.executeUpdate();
				return oriName;
			}

		}
	}

}
