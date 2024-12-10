package Vo;

public class ScreenVO {
	private int screen_id;
	private int theater_id;
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
	@Override
	public String toString() {
		return "Screen [screen_id=" + screen_id + ", theater_id=" + theater_id + "]";
	}
	
	
	
}
