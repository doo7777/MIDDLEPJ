package Vo;

public class CartVO {
	private int cart_id;
	private int product_id;
	private int cart_qty;
	private String cart_status;
	private String custmer_id;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public String getCart_status() {
		return cart_status;
	}
	public void setCart_status(String cart_status) {
		this.cart_status = cart_status;
	}
	
	public String getCustmer_id() {
		return custmer_id;
	}
	public void setCustmer_id(String custmer_id) {
		this.custmer_id = custmer_id;
	}
	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", product_id=" + product_id + ", cart_qty=" + cart_qty + ", cart_status="
				+ cart_status + ", custmer_id=" + custmer_id + "]";
	}

	
	
	
	
	
	
}
