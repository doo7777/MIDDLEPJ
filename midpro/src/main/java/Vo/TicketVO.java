package Vo;

public class TicketVO {
 xx
	
	private int ticket_id;
	private int ticket_price;
	String ticket_type;
	public int getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	public String getTicket_type() {
		return ticket_type;
	}
	public void setTicket_type(String ticket_type) {
		this.ticket_type = ticket_type;
	}
	@Override
	public String toString() {
		return "TicketVO [ticket_id=" + ticket_id + ", ticket_price=" + ticket_price + ", ticket_type=" + ticket_type
				+ "]";
	}
	
	
	
}
