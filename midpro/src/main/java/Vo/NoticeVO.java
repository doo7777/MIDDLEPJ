package Vo;

public class NoticeVO {
	private String notice_id;
	private String title;
	private String content;
	private String post_date;
	private String notice_view;
	
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getTitle() {
		return title;
	}
	public String getNotice_view() {
		return notice_view;
	}
	public void setNotice_view(String notice_view) {
		this.notice_view = notice_view;
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
		return "NoticeVO [notice_id=" + notice_id + ", title=" + title + ", content=" + content + ", post_date="
				+ post_date + ", notice_view=" + notice_view + "]";
	}
	
	
	
	
	
}
