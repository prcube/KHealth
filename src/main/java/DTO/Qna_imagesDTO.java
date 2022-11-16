package DTO;

public class Qna_imagesDTO {
	
	private int images_seq;
	private String oriName;
	private String sysName;
	private int parent_seq;
	
	
	public Qna_imagesDTO() {}
	
	public Qna_imagesDTO(int images_seq, String oriName, String sysName, int parent_seq) {
		super();
		this.images_seq = images_seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.parent_seq = parent_seq;
	}
	public int getImages_seq() {
		return images_seq;
	}
	public void setImages_seq(int images_seq) {
		this.images_seq = images_seq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	
	
	

}
