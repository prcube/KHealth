package DTO;

public class WishlistDTO {
	private int wishlist_seq;
	private String product_name;
	private int product_seq;
	private String product_price;
	private int product_wish_count;
	private String product_wish_user;
	private String product_image_oriName;

	public WishlistDTO(int wishlist_seq, String product_name, int product_seq, String product_price,
			int product_wish_count, String product_wish_user, String product_image_oriName) {
		super();
		this.wishlist_seq = wishlist_seq;
		this.product_name = product_name;
		this.product_seq = product_seq;
		this.product_price = product_price;
		this.product_wish_count = product_wish_count;
		this.product_wish_user = product_wish_user;
		this.product_image_oriName = product_image_oriName;
	}


	public int getWishlist_seq() {
		return wishlist_seq;
	}


	public void setWishlist_seq(int wishlist_seq) {
		this.wishlist_seq = wishlist_seq;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_seq() {
		return product_seq;
	}


	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}

	public String getProduct_price() {
		return product_price;
	}


	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}


	public int getProduct_wish_count() {
		return product_wish_count;
	}


	public void setProduct_wish_count(int product_wish_count) {
		this.product_wish_count = product_wish_count;
	}


	public String getProduct_wish_user() {
		return product_wish_user;
	}


	public void setProduct_wish_user(String product_wish_user) {
		this.product_wish_user = product_wish_user;
	}


	public String getProduct_image_oriName() {
		return product_image_oriName;
	}


	public void setProduct_image_oriName(String product_image_oriName) {
		this.product_image_oriName = product_image_oriName;
	}
	
	
	
}
