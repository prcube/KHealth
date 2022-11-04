package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.QnaCommentsDTO;



public class QnaCommentsDAO {
	
private static QnaCommentsDAO instance = null;
	
	public static QnaCommentsDAO getInstance() throws Exception{
		if(instance == null) {
			instance = new QnaCommentsDAO();
		}
		return instance;
	}
	private QnaCommentsDAO() {}
	
	private Connection getConnection() throws Exception{
		
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int write(QnaCommentsDTO dto)throws Exception{
		String sql = "insert into QnaComments values(QnaComments_seq.nextval,?,?,?,0,sysdate)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getQnaCms_parent_seq());
			pstat.setString(2, dto.getQnaCms_writer());
			pstat.setString(3, dto.getQnaCms_contents());
			
			int result = pstat.executeUpdate();
			con.commit();
			con.close();
			return result;
		}
	}public List<QnaCommentsDTO>selectAll(int qnaCms_seq) throws Exception {
		String sql = "select * from qnaComments where qnacms_parent_seq = ? order by qnacms_write_date desc ";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, qnaCms_seq);
			ResultSet rs = pstat.executeQuery();
			List<QnaCommentsDTO>list = new ArrayList<>();
			while(rs.next()) {
				QnaCommentsDTO dto = new QnaCommentsDTO();
				dto.setQnaCms_seq(rs.getInt("qnaCms_seq"));
				dto.setQnaCms_parent_seq(rs.getInt("qnaCms_parent_seq"));
				dto.setQnaCms_writer(rs.getString("qnaCms_writer"));
				dto.setQnaCms_contents(rs.getString("qnaCms_contents"));
				dto.setQnaCms_nincname(rs.getString("qnaCms_nickname"));
				dto.setQnaCms_write_date(rs.getTimestamp("qnaCms_write_date"));
				list.add(dto);
				
				
			}
			return list;
		}
	}public int delete (int qnaCms_seq)throws Exception {
		String sql = "delete from qnaComments where qnaCms_seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, qnaCms_seq);
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}public int update (String qnaCms_contents , int qnaCms_seq) throws Exception {
		String sql = "update qnaCommtents qnaCms_contents = ? where qnaCms_seq ? ";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, qnaCms_contents);
			pstat.setInt(2, qnaCms_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	

}
