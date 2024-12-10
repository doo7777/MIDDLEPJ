package Vo;

public class Payment {
	private int payment_id;
	private String customer_id;
	private String payment_date;
	private int amount;
	private String payment_method;
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	@Override
	public String toString() {
		return "Payment [payment_id=" + payment_id + ", customer_id=" + customer_id + ", payment_date=" + payment_date
				+ ", amount=" + amount + ", payment_method=" + payment_method + "]";
	}
	
	
}
