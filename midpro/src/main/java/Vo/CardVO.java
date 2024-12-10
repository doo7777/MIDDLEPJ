package Vo;

public class CardVO {
	private int card_id;
	private int payment_id;
	private String customer_id;
	private String card_num;
	private int card_month;
	private int card_year;
	private int card_pw;
	private int card_birth;
	private int cart_ins;
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
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
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public int getCard_month() {
		return card_month;
	}
	public void setCard_month(int card_month) {
		this.card_month = card_month;
	}
	public int getCard_year() {
		return card_year;
	}
	public void setCard_year(int card_year) {
		this.card_year = card_year;
	}
	public int getCard_pw() {
		return card_pw;
	}
	public void setCard_pw(int card_pw) {
		this.card_pw = card_pw;
	}
	public int getCard_birth() {
		return card_birth;
	}
	public void setCard_birth(int card_birth) {
		this.card_birth = card_birth;
	}
	public int getCart_ins() {
		return cart_ins;
	}
	public void setCart_ins(int cart_ins) {
		this.cart_ins = cart_ins;
	}
	@Override
	public String toString() {
		return "Card [card_id=" + card_id + ", payment_id=" + payment_id + ", customer_id=" + customer_id
				+ ", card_num=" + card_num + ", card_month=" + card_month + ", card_year=" + card_year + ", card_pw="
				+ card_pw + ", card_birth=" + card_birth + ", cart_ins=" + cart_ins + "]";
	}
	
	
	
}
