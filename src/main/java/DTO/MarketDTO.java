package DTO;

public class MarketDTO {
	
	private int seq;
	private String name;
	private String id;
	private String nickname;
	private String amount;
	
	
	public MarketDTO(int seq, String name, String id, String nickname, String amount) {
		super();
		this.seq = seq;
		this.name = name;
		this.id = id;
		this.nickname = nickname;
		this.amount = amount;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	

}
