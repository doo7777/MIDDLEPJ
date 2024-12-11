package Vo;


public class ScheduleVO {
	private int schedule_id;
	private int movie_id;
	private String start_time;
	private String end_time;
	private String schedule_date;
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
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
		return "Schedule [schedule_id=" + schedule_id + ", movie_id=" + movie_id + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", schedule_date=" + schedule_date + "]";
	}
	
	
	
}
