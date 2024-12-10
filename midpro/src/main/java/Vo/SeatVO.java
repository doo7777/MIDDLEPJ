package Vo;

public class SeatVO {
	private int seat_id;
	private int screen_id;
	private int theater_id;
	private String seat_group;
	private int seat_no;
	private int seat_line_no;
	private int seat_status;
	
	public int getSeat_id() {
		return seat_id;
	}

	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}

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

	public String getSeat_group() {
		return seat_group;
	}

	public void setSeat_group(String seat_group) {
		this.seat_group = seat_group;
	}

	public int getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}

	public int getSeat_line_no() {
		return seat_line_no;
	}

	public void setSeat_line_no(int seat_line_no) {
		this.seat_line_no = seat_line_no;
	}

	public int getSeat_status() {
		return seat_status;
	}

	public void setSeat_status(int seat_status) {
		this.seat_status = seat_status;
	}

	@Override
	public String toString() {
		return "SeatVO [seat_id=" + seat_id + ", screen_id=" + screen_id + ", theater_id=" + theater_id
				+ ", seat_group=" + seat_group + ", seat_no=" + seat_no + ", seat_line_no=" + seat_line_no
				+ ", seat_status=" + seat_status + "]";
	}




	
	
}
