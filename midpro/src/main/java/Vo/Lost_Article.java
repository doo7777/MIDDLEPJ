package Vo;

public class Lost_Article {
	private int articel_id;
	private String customer_id;
	private String articel_name;
	private String customer_tel;
	private String customer_email;
	private int articel_pass;
	private String description;
	private String articel_title;
	private String articel_date;
	public int getArticel_id() {
		return articel_id;
	}
	public void setArticel_id(int articel_id) {
		this.articel_id = articel_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getArticel_name() {
		return articel_name;
	}
	public void setArticel_name(String articel_name) {
		this.articel_name = articel_name;
	}
	public String getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public int getArticel_pass() {
		return articel_pass;
	}
	public void setArticel_pass(int articel_pass) {
		this.articel_pass = articel_pass;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getArticel_title() {
		return articel_title;
	}
	public void setArticel_title(String articel_title) {
		this.articel_title = articel_title;
	}
	public String getArticel_date() {
		return articel_date;
	}
	public void setArticel_date(String articel_date) {
		this.articel_date = articel_date;
	}
	@Override
	public String toString() {
		return "Lost_Article [articel_id=" + articel_id + ", customer_id=" + customer_id + ", articel_name="
				+ articel_name + ", customer_tel=" + customer_tel + ", customer_email=" + customer_email
				+ ", articel_pass=" + articel_pass + ", description=" + description + ", articel_title=" + articel_title
				+ ", articel_date=" + articel_date + "]";
	}
	
	
	
}
