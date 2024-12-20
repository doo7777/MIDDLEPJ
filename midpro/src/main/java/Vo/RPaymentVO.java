package Vo;

import java.util.Date;

public class RPaymentVO {

	private int payment_id;
	private int reservation_id;
	private Date payment_day;
	private String payment_method;
	private int payment_price;
	private String payment_status;
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public Date getPayment_day() {
		return payment_day;
	}
	public void setPayment_day(Date payment_day) {
		this.payment_day = payment_day;
	}
	public String getPayment_methodn() {
		return payment_method;
	}
	public void setPayment_methodn(String payment_methodn) {
		this.payment_method = payment_methodn;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	@Override
	public String toString() {
		return "RPaymentVO [payment_id=" + payment_id + ", reservation_id=" + reservation_id + ", payment_day="
				+ payment_day + ", payment_methodn=" + payment_method + ", payment_price=" + payment_price
				+ ", payment_status=" + payment_status + "]";
	}
	
	
	
	
}
