package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.ImagesDTO;
import DTO.ProductDTO;



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
	
	public List<ImagesDTO> selectByRange(int start, int end) throws Exception{

		String sql = "select * from (select images.*, row_number() over(order by parent_seq desc) rn from images) where rn between ? and ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			List<ImagesDTO> result = new ArrayList<>();
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs =pstat.executeQuery();){

				while(rs.next()) {

					int images_seq = rs.getInt("images_seq");
					String oriName = rs.getString("oriname");
					String sysName = rs.getString("sysname");
					int parent_seq = rs.getInt("parent_seq");
					
					ImagesDTO dto = new ImagesDTO(images_seq, oriName, sysName, parent_seq);
					result.add(dto);

				}
				return result;
			}

		}
	}
	
	public List<ImagesDTO> selectAll() throws Exception{

		String sql = "select * from images";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			List<ImagesDTO> result = new ArrayList<>();


			try(ResultSet rs =pstat.executeQuery();){

				while(rs.next()) {

					int images_seq = rs.getInt("images_seq");
					String oriName = rs.getString("oriname");
					String sysName = rs.getString("sysname");
					int parent_seq = rs.getInt("parent_seq");
					
					ImagesDTO dto = new ImagesDTO(images_seq, oriName, sysName, parent_seq);
					result.add(dto);

				}
				return result;
			}

		}
	}
	
	
	
	public int getimage(int product_seq) throws Exception{
		
		String sql = "select * from images where parent_seq=?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			
			pstat.setInt(1, product_seq);
			

			try(ResultSet rs =pstat.executeQuery();){

				while(rs.next()) {

					String oriName = rs.getString("oriname");

				}
				int result = pstat.executeUpdate();
				return result;
			}

		}
	}
	
	public String getImageOriName(int product_seq) throws Exception{
		
		String sql = "select * from images where parent_seq=?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			
			pstat.setInt(1, product_seq);
			

			try(ResultSet rs =pstat.executeQuery();){

				rs.next();

					String oriName = rs.getString("oriname");

				
				int result = pstat.executeUpdate();
				return oriName;
			}

		}
	}
	
}
