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
}