package Vo;

public class CustomerVO {

	private String customer_id;
	private String cust_pw;
	private String cust_name;
	private String cust_email;
	private String cust_tel;
	private String cust_postcode;
	private String cust_add;
	private String cust_detailadd;
	private String cust_grade;
	private String cust_delete;
	private String cust_bir;
	private int cust_point;
	private int adminrole;
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCust_pw() {
		return cust_pw;
	}
	public void setCust_pw(String cust_pw) {
		this.cust_pw = cust_pw;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCust_email() {
		return cust_email;
	}
	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}
	public String getCust_tel() {
		return cust_tel;
	}
	public void setCust_tel(String cust_tel) {
		this.cust_tel = cust_tel;
	}
	public String getCust_postcode() {
		return cust_postcode;
	}
	public void setCust_postcode(String cust_postcode) {
		this.cust_postcode = cust_postcode;
	}
	public String getCust_add() {
		return cust_add;
	}
	public void setCust_add(String cust_add) {
		this.cust_add = cust_add;
	}
	public String getCust_detailadd() {
		return cust_detailadd;
	}
	public void setCust_detailadd(String cust_detailadd) {
		this.cust_detailadd = cust_detailadd;
	}
	public String getCust_grade() {
		return cust_grade;
	}
	public void setCust_grade(String cust_grade) {
		this.cust_grade = cust_grade;
	}
	public String getCust_delete() {
		return cust_delete;
	}
	public void setCust_delete(String cust_delete) {
		this.cust_delete = cust_delete;
	}
	public int getRole() {
		return adminrole;
	}
	public void setRole(int role) {
		this.adminrole = role;
	}
	
	public String getCust_bir() {
		return cust_bir;
	}
	public void setCust_bir(String cust_bir) {
		this.cust_bir = cust_bir;
	}
	public int getCust_point() {
		return cust_point;
	}
	public void setCust_point(int cust_point) {
		this.cust_point = cust_point;
	}
	@Override
	public String toString() {
		return "CustomerVO [customer_id=" + customer_id + ", cust_pw=" + cust_pw + ", cust_name=" + cust_name
				+ ", cust_email=" + cust_email + ", cust_tel=" + cust_tel + ", cust_postcode=" + cust_postcode
				+ ", cust_add=" + cust_add + ", cust_detailadd=" + cust_detailadd + ", cust_grade=" + cust_grade
				+ ", cust_delete=" + cust_delete + ", cust_bir=" + cust_bir + ", cust_point=" + cust_point
				+ ", adminrole=" + adminrole + "]";
	}
	
	
	
	
	
	
	
}
