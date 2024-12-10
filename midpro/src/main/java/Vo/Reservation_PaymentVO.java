package Vo;

public class Reservation_PaymentVO {
	private int reservation_payment_id;
	private String customer_id;
	private int movie_id;
	private int schedule_id;
	private int screen_id;
	private String customer_grade;
	private String reserv_pay_date;
	private String reserv_pay_movie_name;
	private String reserv_pay_showtimes;
	private String reserv_pay_theater_name;
	private String reserv_pay_seats;
	private int reserv_pay_pnumber;
	private int reserv_pay_ticketprice;
	private String reserv_pay_method;
	private String reserv_pay_telnum;
	public int getReservation_payment_id() {
		return reservation_payment_id;
	}
	public void setReservation_payment_id(int reservation_payment_id) {
		this.reservation_payment_id = reservation_payment_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
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
	public String getCustomer_grade() {
		return customer_grade;
	}
	public void setCustomer_grade(String customer_grade) {
		this.customer_grade = customer_grade;
	}
	public String getReserv_pay_date() {
		return reserv_pay_date;
	}
	public void setReserv_pay_date(String reserv_pay_date) {
		this.reserv_pay_date = reserv_pay_date;
	}
	public String getReserv_pay_movie_name() {
		return reserv_pay_movie_name;
	}
	public void setReserv_pay_movie_name(String reserv_pay_movie_name) {
		this.reserv_pay_movie_name = reserv_pay_movie_name;
	}
	public String getReserv_pay_showtimes() {
		return reserv_pay_showtimes;
	}
	public void setReserv_pay_showtimes(String reserv_pay_showtimes) {
		this.reserv_pay_showtimes = reserv_pay_showtimes;
	}
	public String getReserv_pay_theater_name() {
		return reserv_pay_theater_name;
	}
	public void setReserv_pay_theater_name(String reserv_pay_theater_name) {
		this.reserv_pay_theater_name = reserv_pay_theater_name;
	}
	public String getReserv_pay_seats() {
		return reserv_pay_seats;
	}
	public void setReserv_pay_seats(String reserv_pay_seats) {
		this.reserv_pay_seats = reserv_pay_seats;
	}
	public int getReserv_pay_pnumber() {
		return reserv_pay_pnumber;
	}
	public void setReserv_pay_pnumber(int reserv_pay_pnumber) {
		this.reserv_pay_pnumber = reserv_pay_pnumber;
	}
	public int getReserv_pay_ticketprice() {
		return reserv_pay_ticketprice;
	}
	public void setReserv_pay_ticketprice(int reserv_pay_ticketprice) {
		this.reserv_pay_ticketprice = reserv_pay_ticketprice;
	}
	public String getReserv_pay_method() {
		return reserv_pay_method;
	}
	public void setReserv_pay_method(String reserv_pay_method) {
		this.reserv_pay_method = reserv_pay_method;
	}

	
	public String getReserv_pay_telnum() {
		return reserv_pay_telnum;
	}
	public void setReserv_pay_telnum(String reserv_pay_telnum) {
		this.reserv_pay_telnum = reserv_pay_telnum;
	}
	@Override
	public String toString() {
		return "Reservation_PaymentVO [reservation_payment_id=" + reservation_payment_id + ", customer_id="
				+ customer_id + ", movie_id=" + movie_id + ", schedule_id=" + schedule_id + ", screen_id=" + screen_id
				+ ", customer_grade=" + customer_grade + ", reserv_pay_date=" + reserv_pay_date
				+ ", reserv_pay_movie_name=" + reserv_pay_movie_name + ", reserv_pay_showtimes=" + reserv_pay_showtimes
				+ ", reserv_pay_theater_name=" + reserv_pay_theater_name + ", reserv_pay_seats=" + reserv_pay_seats
				+ ", reserv_pay_pnumber=" + reserv_pay_pnumber + ", reserv_pay_ticketprice=" + reserv_pay_ticketprice
				+ ", reserv_pay_method=" + reserv_pay_method + ", reserv_pay_telnum=" + reserv_pay_telnum + "]";
	}

	
	
}
