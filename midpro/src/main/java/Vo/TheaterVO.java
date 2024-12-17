package Vo;

public class TheaterVO {
	private int theater_id;
	private String theater_img;
	private String theater_name;
	private String theater_address;
	
	private String theater_do;
	private String theater_tel;
	
	private String theater_screen;
	private String theater_bus;
	private String theater_sub;
	private String theater_notice;
	private String theater_spot1;
	private String theater_spot2;
	
	
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
	public String getTheater_do() {
		return theater_do;
	}
	public void setTheater_do(String theater_do) {
		this.theater_do = theater_do;
	}
	public String getTheater_tel() {
		return theater_tel;
	}
	public void setTheater_tel(String theater_tel) {
		this.theater_tel = theater_tel;
	}
	
	public String getTheater_screen() {
		return theater_screen;
	}
	public void setTheater_screen(String theater_screen) {
		this.theater_screen = theater_screen;
	}
	public String getTheater_bus() {
		return theater_bus;
	}
	public void setTheater_bus(String theater_bus) {
		this.theater_bus = theater_bus;
	}
	public String getTheater_sub() {
		return theater_sub;
	}
	public void setTheater_sub(String theater_sub) {
		this.theater_sub = theater_sub;
	}
	public String getTheater_notice() {
		return theater_notice;
	}
	public void setTheater_notice(String theater_notice) {
		this.theater_notice = theater_notice;
	}
	public String getTheater_spot1() {
		return theater_spot1;
	}
	public void setTheater_spot1(String theater_spot1) {
		this.theater_spot1 = theater_spot1;
	}
	public String getTheater_spot2() {
		return theater_spot2;
	}
	public void setTheater_spot2(String theater_spot2) {
		this.theater_spot2 = theater_spot2;
	}
	
	
	
	
	@Override
	public String toString() {
		return "TheaterVO [theater_id=" + theater_id + ", theater_img=" + theater_img + ", theater_name=" + theater_name
				+ ", theater_address=" + theater_address + ", theater_do=" + theater_do + ", theater_tel=" + theater_tel
				+ ", theater_screen=" + theater_screen + ", theater_bus=" + theater_bus + ", theater_sub=" + theater_sub
				+ ", theater_notice=" + theater_notice + ", theater_spot1=" + theater_spot1 + ", theater_spot2="
				+ theater_spot2 + "]";
	}
	
	


	
	
}
