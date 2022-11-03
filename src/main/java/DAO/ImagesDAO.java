package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.ImagesDTO;



public class ImagesDAO {
	private static ImagesDAO instance;

	synchronized public static ImagesDAO getInstance() throws Exception{

		if (instance == null) {
			instance = new ImagesDAO();
		}
		return instance;
	}

	private ImagesDAO() {}


	private Connection getConnection() throws Exception{

		// JDNI 기법 적용 
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();


	}

	public int getnextval() throws Exception{

		String sql = "select images_seq.nextval from dual";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){ 


			try(ResultSet rs =pstat.executeQuery();){

				rs.next();

				int seq = rs.getInt("nextval");
				return seq;
			}

		}


	}
	
	public int insert(ImagesDTO dto) throws Exception{
		String sql = "insert into images values(images_seq.nextval,?,?,?)";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);)
		{
			pstat.setString(1, dto.getOriName());
			pstat.setString(2, dto.getSysName());
			pstat.setInt(3, dto.getParent_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
}
