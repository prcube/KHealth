package DTO;

public class ProductDTO {
	private int product_seq;
	private String product_name;
	private String product_price;
	private String product_count;
	private String product_review;
	
	public ProductDTO(int product_seq, String product_name, String product_price, String product_count,
			String product_review) {
		super();
		this.product_seq = product_seq;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_count = product_count;
		this.product_review = product_review;
	}

	public int getProduct_seq() {
		return product_seq;
	}

	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getProduct_count() {
		return product_count;
	}

	public void setProduct_count(String product_count) {
		this.product_count = product_count;
	}

	public String getProduct_review() {
		return product_review;
	}

	public void setProduct_review(String product_review) {
		this.product_review = product_review;
	}
	
	
}
