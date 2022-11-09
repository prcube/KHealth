package DTO;

public class MypageDTO {
	private int seq;
	private String product_name;
	private String id;
	private String nickname;
	private int amount;
	
	
	public MypageDTO(int seq, String product_name, String id, String nickname, int amount) {
		super();
		this.seq = seq;
		this.product_name = product_name;
		this.id = id;
		this.nickname = nickname;
		this.amount = amount;
	}
	
	public MypageDTO() {}
	public MypageDTO(String id) {
		this.id = id;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

}
