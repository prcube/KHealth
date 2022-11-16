package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.Qna_imagesDTO;


public class Qna_imagesDAO {
	
	private static Qna_imagesDAO instance;

	synchronized public static Qna_imagesDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new Qna_imagesDAO();
		}
		return instance;
	}

	// DBCP 기능
	private Qna_imagesDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext(); //
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); // 찾아달라는 명령어 lookup ,java:comp/env/밑에 있는
																				// jdbc/oracle을 찾아달라는것
		return ds.getConnection();
	}

	// qna_seq 랑 같은 숫자로 올라가게 하는 코드
	public int getnextval() throws Exception {

		String sql = "select qna_seq.nextval from dual";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();

				int seq = rs.getInt("nextval");
				return seq;
			}

		}

	}

	public int insert(Qna_imagesDTO dto) throws Exception {
		String sql = "insert into qna_images values(?,?,?,?)";
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

	public List<Qna_imagesDTO> selectAll() throws Exception {

		String sql = "select * from qna_images";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			List<Qna_imagesDTO> result = new ArrayList<>();

			try (ResultSet rs = pstat.executeQuery();) {

				while (rs.next()) {

					int images_seq = rs.getInt("images_seq");
					String oriName = rs.getString("oriname");
					String sysName = rs.getString("sysname");
					int parent_seq = rs.getInt("parent_seq");

					Qna_imagesDTO dto = new Qna_imagesDTO(images_seq, oriName, sysName, parent_seq);
					result.add(dto);

				}
				return result;
			}

		}
	}

	public int getimage(int qna_seq) throws Exception {

		String sql = "select * from qna_images where parent_seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, qna_seq);

			try (ResultSet rs = pstat.executeQuery();) {

				while (rs.next()) {

					String oriName = rs.getString("oriname");

				}
				int result = pstat.executeUpdate();
				return result;
			}

		}
	}

	public String getImageOriName(int qna_seq) throws Exception {

		String sql = "select * from qna_images where parent_seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, qna_seq);
			System.out.println(qna_seq);
			try (ResultSet rs = pstat.executeQuery();) {

				if(rs.next()) {
					String oriName = rs.getString("ORINAME");
					System.out.println(oriName);
					int result = pstat.executeUpdate();
					return oriName;
				}else {
					return "";
				}


				
			}

		}
	}


}
