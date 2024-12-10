package Vo;

public class TheaterVO {
	private int theater_id;
	private String theater_img;
	private String theater_name;
	private String theater_address;
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public String getTheater_img() {
		return theater_img;
	}
	public void setTheater_img(String theater_img) {
		this.theater_img = theater_img;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_address() {
		return theater_address;
	}
	public void setTheater_address(String theater_address) {
		this.theater_address = theater_address;
	}
	@Override
	public String toString() {
		return "Theater [theater_id=" + theater_id + ", theater_img=" + theater_img + ", theater_name=" + theater_name
				+ ", theater_address=" + theater_address + "]";
	}
	
	
	
}
