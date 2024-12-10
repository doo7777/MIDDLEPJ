package Vo;

public class Cart {
	private int cart_id;
	private int product_id;
	private int cart_qty;
	private String cart_status;
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
	@Override
	public String toString() {
		return "Cart [cart_id=" + cart_id + ", product_id=" + product_id + ", cart_qty=" + cart_qty + ", cart_status="
				+ cart_status + ", getCart_id()=" + getCart_id() + ", getProduct_id()=" + getProduct_id()
				+ ", getCart_qty()=" + getCart_qty() + ", getCart_status()=" + getCart_status() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
