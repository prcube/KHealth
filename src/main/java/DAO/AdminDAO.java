package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


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
		String sql = "insert into product values(?,?,?,?,?)";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){ 
			
			pstat.setInt(1, dto.getProduct_seq());
			pstat.setString(2, dto.getProduct_name());
			pstat.setString(3, dto.getProduct_price());
			pstat.setString(4, dto.getProduct_count());
			pstat.setString(5, dto.getProduct_review());

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
}
