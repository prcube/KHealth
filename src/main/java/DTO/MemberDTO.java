package DTO;

import java.sql.Timestamp;

public class MemberDTO {

	private int seq;
	private int role;
	private String pwd;
	private String name;
	private String nickname;
	private String mail;
	private String number;
	private String zip;
	private String address1;
	private String address2;
	private String launch_date;
	
	
	public MemberDTO() {};
	public MemberDTO(int seq, String pwd, String name, String nickname, String mail, String number, String zip,
			String address1, String address2, String launch_date, int role) {
		super();
		this.seq = seq;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.mail = mail;
		this.number = number;
		this.zip = zip;
		this.address1 = address1;
		this.address2 = address2;
		this.launch_date = launch_date;
		this.role = role;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getLaunch_date() {
		return launch_date;
	}
	
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public void setLaunch_date(String launch_date) {
		this.launch_date = launch_date;
	}
	
	
}
