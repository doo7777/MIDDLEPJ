package Vo;

public class CouponVO {
	private int coupon_id;
	private String customer_id;
	private String coupon_code;
	private int discount;
	private String expiration_date;
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(String expiration_date) {
		this.expiration_date = expiration_date;
	}
	@Override
	public String toString() {
		return "Coupon [coupon_id=" + coupon_id + ", customer_id=" + customer_id + ", coupon_code=" + coupon_code
				+ ", discount=" + discount + ", expiration_date=" + expiration_date + ", getCoupon_id()="
				+ getCoupon_id() + ", getCustomer_id()=" + getCustomer_id() + ", getCoupon_code()=" + getCoupon_code()
				+ ", getDiscount()=" + getDiscount() + ", getExpiration_date()=" + getExpiration_date()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
	
}
