package Vo;

public class ProductVO {
	private int product_id;
	private String product_type;
	private String product_name;
	private String product_detail;
	private String product_exp;
	private int product_price;
	private int product_sale_price;
	private String product_image;
	private int product_status;
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public String getProduct_exp() {
		return product_exp;
	}
	public void setProduct_exp(String product_exp) {
		this.product_exp = product_exp;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_sale_price() {
		return product_sale_price;
	}
	public void setProduct_sale_price(int product_sale_price) {
		this.product_sale_price = product_sale_price;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getProduct_status() {
		return product_status;
	}
	public void setProduct_status(int product_status) {
		this.product_status = product_status;
	}
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_type=" + product_type + ", product_name=" + product_name
				+ ", product_detail=" + product_detail + ", product_exp=" + product_exp + ", product_price="
				+ product_price + ", product_sale_price=" + product_sale_price + ", product_image=" + product_image
				+ ", product_status=" + product_status + "]";
	}
	
	
	
	
}
