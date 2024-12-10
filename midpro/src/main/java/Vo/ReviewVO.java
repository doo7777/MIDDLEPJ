package Vo;

public class ReviewVO {
	private int review_num;
	private int movie_id;
	private String customer_id;
	private int rev_star;
	private String rev_content;
	private String rev_date;
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getRev_star() {
		return rev_star;
	}
	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	@Override
	public String toString() {
		return "Review [review_num=" + review_num + ", movie_id=" + movie_id + ", customer_id=" + customer_id
				+ ", rev_star=" + rev_star + ", rev_content=" + rev_content + ", rev_date=" + rev_date + "]";
	}
	
	
}