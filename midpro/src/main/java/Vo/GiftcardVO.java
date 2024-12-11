package Vo;

import java.util.Date;

public class GiftcardVO {
	private int giftcard_id;
	private String customer_id;
	private String giftcard_code;
	private int giftcard_price;
	private Date expiration_date;
	public int getGiftcard_id() {
		return giftcard_id;
	}
	public void setGiftcard_id(int giftcard_id) {
		this.giftcard_id = giftcard_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getGiftcard_code() {
		return giftcard_code;
	}
	public void setGiftcard_code(String giftcard_code) {
		this.giftcard_code = giftcard_code;
	}
	public int getGiftcard_price() {
		return giftcard_price;
	}
	public void setGiftcard_price(int giftcard_price) {
		this.giftcard_price = giftcard_price;
	}
	public Date getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
	}
	@Override
	public String toString() {
		return "GiftcardVO [giftcard_id=" + giftcard_id + ", customer_id=" + customer_id + ", giftcard_code="
				+ giftcard_code + ", giftcard_price=" + giftcard_price + ", expiration_date=" + expiration_date + "]";
	}
  
	
	
	
	
	
}
