package DTO;

import java.sql.Timestamp;

public class MemberDTO {
	
	private int member_seq;
	private String member_id;
	private String member_pw;
	private String member_name;
	private Timestamp member_join_date;
	private int member_role;
	private String member_email;
	private String member_phone;
	
	
	
	public MemberDTO () {}
	public MemberDTO(int member_seq, String member_id, String member_pw, String member_name, Timestamp member_join_date,
			int member_role, String member_email, String member_phone) {
		super();
		this.member_seq = member_seq;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_join_date = member_join_date;
		this.member_role = member_role;
		this.member_email = member_email;
		this.member_phone = member_phone;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Timestamp getMember_join_date() {
		return member_join_date;
	}
	public void setMember_join_date(Timestamp member_join_date) {
		this.member_join_date = member_join_date;
	}
	public int getMember_role() {
		return member_role;
	}
	public void setMember_role(int member_role) {
		this.member_role = member_role;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	


}
