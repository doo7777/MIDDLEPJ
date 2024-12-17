package Vo;


public class ScheduleVO {
	private int schedule_id;
<<<<<<< HEAD
=======
	private int screen_id;
	private int theater_id;
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ
	private String movie_name;
	private String start_time;
	private String end_time;
	private String schedule_date;
	
	
	
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
<<<<<<< HEAD
	public String getMovie_name() {
		return movie_name;
=======
	public int getScreen_id() {
		return screen_id;
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ
	}
<<<<<<< HEAD
=======
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
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ
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
	
	
	@Override
	public String toString() {
<<<<<<< HEAD
		return "ScheduleVO [schedule_id=" + schedule_id + ", movie_name=" + movie_name + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", schedule_date=" + schedule_date + "]";
=======
		return "ScheduleVO [schedule_id=" + schedule_id + ", screen_id=" + screen_id + ", theater_id=" + theater_id
				+ ", movie_name=" + movie_name + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", schedule_date=" + schedule_date + "]";
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ
	}
	

	
	
	
	
}
