package DTO;

import java.sql.Timestamp;

public class BlacklistDTO {

	private int blacklist_seq;
	private String blacklist_member_nickname;
	private Timestamp blacklist_date;
	
	public BlacklistDTO(int blacklist_seq, String blacklist_member_nickname, Timestamp blacklist_date) {
		super();
		this.blacklist_seq = blacklist_seq;
		this.blacklist_member_nickname = blacklist_member_nickname;
		this.blacklist_date = blacklist_date;
	}
	
	public int getBlacklist_seq() {
		return blacklist_seq;
	}
	public void setBlacklist_seq(int blacklist_seq) {
		this.blacklist_seq = blacklist_seq;
	}
	public String getBlacklist_member_nickname() {
		return blacklist_member_nickname;
	}
	public void setBlacklist_member_nickname(String blacklist_member_nickname) {
		this.blacklist_member_nickname = blacklist_member_nickname;
	}
	public Timestamp getBlacklist_date() {
		return blacklist_date;
	}
	public void setBlacklist_date(Timestamp blacklist_date) {
		this.blacklist_date = blacklist_date;
	}
	
	
}
