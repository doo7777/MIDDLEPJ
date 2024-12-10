package Vo;

public class One_On_One_BoardVO {
	private String oneonone_id;
	private String customer_id;
	private String person_name;
	private String person_tel;
	private String person_email;
	private String location;
	private String question_type;
	private String subject;
	private String content;
	private String fileimg;
	private String writedate;
	private String res_board;
	private String response_board_content;
	public String getOneonone_id() {
		return oneonone_id;
	}
	public void setOneonone_id(String oneonone_id) {
		this.oneonone_id = oneonone_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getPerson_name() {
		return person_name;
	}
	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}
	public String getPerson_tel() {
		return person_tel;
	}
	public void setPerson_tel(String person_tel) {
		this.person_tel = person_tel;
	}
	public String getPerson_email() {
		return person_email;
	}
	public void setPerson_email(String person_email) {
		this.person_email = person_email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileimg() {
		return fileimg;
	}
	public void setFileimg(String fileimg) {
		this.fileimg = fileimg;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getRes_board() {
		return res_board;
	}
	public void setRes_board(String res_board) {
		this.res_board = res_board;
	}
	public String getResponse_board_content() {
		return response_board_content;
	}
	public void setResponse_board_content(String response_board_content) {
		this.response_board_content = response_board_content;
	}
	@Override
	public String toString() {
		return "One_On_One_Board [oneonone_id=" + oneonone_id + ", customer_id=" + customer_id + ", person_name="
				+ person_name + ", person_tel=" + person_tel + ", person_email=" + person_email + ", location="
				+ location + ", question_type=" + question_type + ", subject=" + subject + ", content=" + content
				+ ", fileimg=" + fileimg + ", writedate=" + writedate + ", res_board=" + res_board
				+ ", response_board_content=" + response_board_content + "]";
	}
	
	
	
}
