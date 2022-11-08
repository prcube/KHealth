package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.MemberDTO;

public class MembersDAO {
	private static MembersDAO instance = null;

	public static MembersDAO getInstance() {
		if (instance == null) {
			instance = new MembersDAO();
		}
		return instance;
	}

	java.util.Date starttijd = new java.util.Date();

	private MembersDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insert(String id, String pwd, String name, String launch_date, String nickname, int role, String number,
			String mail, String zip, String address1, String address2) throws Exception {
		String sql = "insert into members values(members_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, pwd);
			pstat.setString(3, name);
			pstat.setString(4, launch_date);
			pstat.setString(5, nickname);
			pstat.setInt(6, role);
			pstat.setString(7, mail);
			pstat.setString(8, number);
			pstat.setString(9, zip);
			pstat.setString(10, address1);
			pstat.setString(11, address2);

			int result = pstat.executeUpdate();
			con.setAutoCommit(false);
			con.close();
			return result;
		}
	}

	public boolean login(String id, String pwd) throws Exception { // 어떤 계정에 대한 실제로 로그인을 시도하는 함수, 인자값으로 ID와 Password를 받아
		// login을 판단함.
		String sql = "SELECT * FROM members WHERE member_id = ? and member_pw = ? "; // 실제로 DB에 입력될 명령어를 SQL 문장으로 만듬.
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, pwd);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}

	public boolean isIDExist(String id) throws Exception {
		String sql = "select * from members where member_id = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}

	public MemberDTO selectById(String id) throws Exception {
		String sql = "select * from members where member_id = ?";
		try (Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			ResultSet rs = pstat.executeQuery();
			rs.next();
			MemberDTO dto = new MemberDTO();
			dto.setSeq(rs.getInt("member_seq"));
			dto.setRole(rs.getInt("member_role"));
			dto.setPwd(rs.getString("member_pw"));
			dto.setName(rs.getString("member_name"));
			dto.setNickname(rs.getString("member_nickname"));
			dto.setMail(rs.getString("member_email"));
			dto.setNumber(rs.getString("meber_phone"));
			dto.setZip(rs.getString("member_post"));
			dto.setAddress1(rs.getString("member_address"));
			dto.setAddress2(rs.getString("member_address_detail"));
			dto.setLaunch_date(rs.getString("member_join_date"));		
			return dto;
		}
	}
		
	public int mypageUpdate(MemberDTO dto , String id ) throws Exception {
		
		String sql = "update members set member_nickname=?, member_email=?, meber_phone=?, member_address=? where member_id=?";
		try(
			Connection con = getConnection();
			PreparedStatement pstat=con.prepareStatement(sql);){
			pstat.setString(1,dto.getNickname());
			pstat.setString(2,dto.getMail());
			pstat.setString(3,dto.getNumber());
			pstat.setString(4,dto.getAddress1());
			pstat.setString(5,id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	public boolean isYouTeacher(String id) throws Exception {
		String sql = "select * from members where member_role=1 and member_id =?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}

	}
	
	public boolean isYouAdmin(String id) throws Exception{
		String sql ="select * from members where member_role=2 and member_id =?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
}
