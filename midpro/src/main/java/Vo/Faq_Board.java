package Vo;

public class Faq_Board {
	private int faq_num;
	private String faq_group;
	private String faq_question;
	private String faq_answer;
	private String faq_view;
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_group() {
		return faq_group;
	}
	public void setFaq_group(String faq_group) {
		this.faq_group = faq_group;
	}
	public String getFaq_question() {
		return faq_question;
	}
	public void setFaq_question(String faq_question) {
		this.faq_question = faq_question;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
	public String getFaq_view() {
		return faq_view;
	}
	public void setFaq_view(String faq_view) {
		this.faq_view = faq_view;
	}
	@Override
	public String toString() {
		return "Faq_Board [faq_num=" + faq_num + ", faq_group=" + faq_group + ", faq_question=" + faq_question
				+ ", faq_answer=" + faq_answer + ", faq_view=" + faq_view + "]";
	}
	
	
	
}
