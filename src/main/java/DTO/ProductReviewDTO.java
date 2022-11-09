package DTO;

public class ProductReviewDTO {
	
	private int pr_seq;
	private int pr_productseq;
	private String pr_contents;
	private String pr_writer;
	private String pr_id;
	
	
	public ProductReviewDTO(int pr_seq, int pr_productseq, String pr_contents, String pr_writer, String pr_id) {
		
		this.pr_seq = pr_seq;
		this.pr_productseq = pr_productseq;
		this.pr_contents = pr_contents;
		this.pr_writer = pr_writer;
		this.pr_id = pr_id;
	}
	public ProductReviewDTO() {
		
	}
	public int getPr_seq() {
		return pr_seq;
	}
	public void setPr_seq(int pr_seq) {
		this.pr_seq = pr_seq;
	}
	public int getPr_productseq() {
		return pr_productseq;
	}
	public void setPr_productseq(int pr_productseq) {
		this.pr_productseq = pr_productseq;
	}
	public String getPr_contents() {
		return pr_contents;
	}
	public void setPr_contents(String pr_contents) {
		this.pr_contents = pr_contents;
	}
	public String getPr_writer() {
		return pr_writer;
	}
	public void setPr_writer(String pr_writer) {
		this.pr_writer = pr_writer;
	}
	public String getPr_id() {
		return pr_id;
	}
	public void setPr_id(String pr_id) {
		this.pr_id = pr_id;
	}
	
	
	
	

}
