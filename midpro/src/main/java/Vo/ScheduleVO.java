package Vo;


public class ScheduleVO {
	private int schedule_id;

	private int screen_id;
	private int theater_id;

	private String movie_name;
	private String start_time;
	private String end_time;
	private String schedule_date;
	
	private String theater_name;
	private String screen_name;
	
	
	
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
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
	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name; 
	}
	@Override
	public String toString() {
		return "ScheduleVO [schedule_id=" + schedule_id + ", screen_id=" + screen_id + ", theater_id=" + theater_id
				+ ", movie_name=" + movie_name + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", schedule_date=" + schedule_date + ", theater_name=" + theater_name + ", screen_name=" + screen_name
				+ "]";
	}
	
	
	
	
	
	

	
	
	
}
