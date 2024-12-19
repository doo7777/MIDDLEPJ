package Vo;

public class ScreenVO {
	private int screen_id;
	private int theater_id;
	private String screen_name;
	private String screen_type;
	public int getScreen_id() {
		return screen_id;
	}
	public void setScreen_id(int screen_id) {
		this.screen_id = screen_id;
	}
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	
	
	
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public String getScreen_type() {
		return screen_type;
	}
	public void setScreen_type(String screen_type) {
		this.screen_type = screen_type;
	}
	@Override
	public String toString() {
		return "ScreenVO [screen_id=" + screen_id + ", theater_id=" + theater_id + ", screen_name=" + screen_name
				+ ", screen_type=" + screen_type + "]";
	}
	
	
	
	
}
