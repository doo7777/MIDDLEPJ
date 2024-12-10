package Vo;

public class Notice {
	private int notice_id;
	private String title;
	private String content;
	private String post_date;
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "Notice [notice_id=" + notice_id + ", title=" + title + ", content=" + content + ", post_date="
				+ post_date + "]";
	}
	
	
	
}
