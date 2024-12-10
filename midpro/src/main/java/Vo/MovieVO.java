package Vo;

public class MovieVO {
	private int movie_id;
	private String movie_name;
	private String trailer;
	private String plot;
	private int product_year;
	private int show_time;
	private String start_date;
	private String end_date;
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public int getProduct_year() {
		return product_year;
	}
	public void setProduct_year(int product_year) {
		this.product_year = product_year;
	}
	public int getShow_time() {
		return show_time;
	}
	public void setShow_time(int show_time) {
		this.show_time = show_time;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;

	
	}
	@Override
	public String toString() {
		return "Movie [movie_id=" + movie_id + ", movie_name=" + movie_name + ", trailer=" + trailer + ", plot=" + plot
				+ ", product_year=" + product_year + ", show_time=" + show_time + ", start_date=" + start_date
				+ ", end_date=" + end_date + "]";
	}
	
	
	
	
}
