package DTO;

public class WishlistDTO {
	private int wishlist_seq;
	private String product_name;
	private String product_price;
	private int product_wish_count;
	private String product_wish_user;
	
	
	public WishlistDTO(int wishlist_seq, String product_name, String product_price, int product_wish_count,
			String product_wish_user) {
		super();
		this.wishlist_seq = wishlist_seq;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_wish_count = product_wish_count;
		this.product_wish_user = product_wish_user;
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
	
	
	
}
