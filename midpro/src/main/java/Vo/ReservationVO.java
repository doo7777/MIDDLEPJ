
package Vo;

import java.util.Date;

public class ReservationVO {
	private int reservation_id;
	private String customer_id;
	private int seat_id;
	private int schedule_id;
	private String movie_name;
	private int screen_id;
	private int theater_id;
	private int reservation_num;
	private String reservation_status;
	private Date reservation_date;
	
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
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
	public int getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
	}
	public String getReservation_status() {
		return reservation_status;
	}
	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}
	public Date getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(Date reservation_date) {
		this.reservation_date = reservation_date;
	}

	@Override
	public String toString() {
		return "Reservation_PaymentVO [reservation_id=" + reservation_id + ", customer_id=" + customer_id + ", seat_id="
				+ seat_id + ", schedule_id=" + schedule_id + ", movie_name=" + movie_name + ", screen_id=" + screen_id
				+ ", theater_id=" + theater_id + ", reservation_num=" + reservation_num + ", reservation_status="
				+ reservation_status + ", reservation_date=" + reservation_date + ", ticket_id=" + "]";
	}
	
	
	
	
	
}
