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
					PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setInt(1, dto.getParent_seq());
				pstat.setString(2, dto.getOriName());
				pstat.setString(3, dto.getSysName());

				
				int result = pstat.executeUpdate();
				//System.out.println(dto.getParent_seq());
				//System.out.println(dto.getOriName());
				//System.out.println(dto.getSysName());
				con.commit();
				return result;
				
				
				
				
			}
		}public List<FilesDTO> selectAll(int qna_seq) throws Exception {

			List<FilesDTO> list = new ArrayList<>();
			//parent_seq값을 seq로 받아준다.
			String sql  =  "select * from files where parent_seq=?";
			try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setInt(1, qna_seq);
				ResultSet rs = pstat.executeQuery();
				
				while(rs.next()) {
					System.out.println(1);
					int seq = rs.getInt("seq");
					String oriName = rs.getString("oriName");
					String sysName = rs.getString("sysName");
					int parent_seq = rs.getInt("parent_seq");
					list.add(new FilesDTO(seq,oriName,sysName,parent_seq));
//					FilesDTO dto  = new FilesDTO();
//					dto.setSeq(rs.getInt("seq"));
//					dto.setSysName(rs.getString("oriName"));
//					dto.setOriName(rs.getString("sysName"));
//					dto.setParent_seq(rs.getInt("parent_seq"));
//					System.out.println(rs.getInt("seq"));
//					System.out.println(rs.getString("oriName"));
//					System.out.println(rs.getString("sysName"));
//					System.out.println(rs.getInt("parent_seq"));
//					list.add(dto);
					System.out.println(2);
				}
				return list;
			
				
			}
		}
}


