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

import DTO.BlacklistDTO;
import DTO.ProductDTO;



public class AdminDAO {
	private static AdminDAO instance;

	synchronized public static AdminDAO getInstance() throws Exception{

		if (instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	private AdminDAO() {}


	private Connection getConnection() throws Exception{

		// JDNI 기법 적용 
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();


	}

	public int getnextval() throws Exception{

		String sql = "select product_seq.nextval from dual";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){ 


			try(ResultSet rs =pstat.executeQuery();){

				rs.next();

				int seq = rs.getInt("nextval");
				return seq;
			}

		}

	}

	public int insertProduct(ProductDTO dto) throws Exception{
		String sql = "insert into product values(?,?,?,?)";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){ 

			pstat.setInt(1, dto.getProduct_seq());
			pstat.setString(2, dto.getProduct_name());
			pstat.setString(3, dto.getProduct_price());
			pstat.setInt(4, dto.getProduct_count());


			int result = pstat.executeUpdate();
			return result;

		}
	}

	public int insertBlackList(String member_nickname) throws Exception {
		String sql = "insert into blacklist values(blacklist_seq.nextval,?,sysdate)";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){ 

			pstat.setString(1, member_nickname);

			int result = pstat.executeUpdate();
			return result;

		}
	}
	public List<BlacklistDTO> selectAll() throws Exception {
		String sql = "select * from blacklist order by blacklist_seq desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			List<BlacklistDTO> list = new ArrayList<>();
			while(rs.next()) {
				int blacklist_seq = rs.getInt("blacklist_seq");
				String blacklist_member_nickname = rs.getString("blacklist_member_nickname");
				Timestamp blacklist_date = rs.getTimestamp("blacklist_date");
				BlacklistDTO dto = new BlacklistDTO(blacklist_seq, blacklist_member_nickname, blacklist_date);
				list.add(dto);
			}
			return list;
		}
	}
	
	public int removeBlacklist(int blacklist_seq) throws Exception{
		String sql = "delete from blacklist where blacklist_seq=?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){ 

			pstat.setInt(1, blacklist_seq);

			int result = pstat.executeUpdate();
			return result;

		}
	}
}
