package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.FilesDTO;

public class FilesDAO {
private static FilesDAO instance = null;
	
	
	public static FilesDAO getInstacne() throws Exception{
		if(instance ==null) {
			instance = new  FilesDAO();
		}
		return instance;
	}
		
		private FilesDAO() {}
		
		private Connection getConnection() throws Exception{
//			톰캣환경에서 검색(lookup)해서 찾아달라.
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			return ds.getConnection();
		}
		public int insert(FilesDTO dto )throws Exception{
			
			String sql  = "insert into files values(files_seq.nextval,?,?,?)";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql)){
				pstat.setString(1, dto.getOriName());
				pstat.setString(2, dto.getSysName());
				pstat.setInt(3, dto.getParent_seq());
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}
		}public List<FilesDTO> selectAll(int seq) throws Exception {
//			parent_seq값을 seq로 받아준다.
			String sql  =  "select * from files where parent_seq = ?";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){
			
				pstat.setInt(1, seq);
				ResultSet rs = pstat.executeQuery();
				
				List<FilesDTO> list = new ArrayList<>();
				while(rs.next()) {
					FilesDTO dto  = new FilesDTO();
					dto.setOriName(rs.getString("oriname"));
					dto.setParent_seq(rs.getInt("parent_seq"));
					dto.setSeq(rs.getInt("seq"));
					dto.setSysName(rs.getString("sysname"));
					list.add(dto);
					
				}
				return list;
			}
		}

}
