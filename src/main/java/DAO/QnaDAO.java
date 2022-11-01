package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.QnaDTO;

public class QnaDAO {
//	싱글턴
	private static QnaDAO instance = null;
	
	public static QnaDAO getInstance() throws Exception {
		if (instance == null) {
			instance = new QnaDAO();
		
	}
	return instance;
}
	private QnaDAO() {}
	
	private Connection getConnection() throws Exception{
		
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int write(QnaDTO dto) throws Exception {
		String sql = "insert into qna values (?,?,?,?,sysdate,?,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setInt(1,dto.getQna_seq());
			pstat.setString(2,dto.getQna_title());
			pstat.setString(3, dto.getQna_writer());
			pstat.setString(4, dto.getQna_contents());
			pstat.setInt(5, dto.getQna_view_count());
			pstat.setString(6, dto.getQna_nickname());
			int result = pstat.executeUpdate();
			con.commit();
			con.close();
			return result;
			
		}
	}
}
	


