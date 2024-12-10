package Vo;

public class NonMemberVO {
	private String nonmember_id;
	private String nmem_name;
	private String nmem_pw;
	private String nmem_tel;
	private String nmem_birth;
	public String getNonmember_id() {
		return nonmember_id;
	}
	public void setNonmember_id(String nonmember_id) {
		this.nonmember_id = nonmember_id;
	}
	public String getNmem_name() {
		return nmem_name;
	}
	public void setNmem_name(String nmem_name) {
		this.nmem_name = nmem_name;
	}
	public String getNmem_pw() {
		return nmem_pw;
	}
	public void setNmem_pw(String nmem_pw) {
		this.nmem_pw = nmem_pw;
	}
	public String getNmem_tel() {
		return nmem_tel;
	}
	public void setNmem_tel(String nmem_tel) {
		this.nmem_tel = nmem_tel;
	}
	public String getNmem_birth() {
		return nmem_birth;
	}
	public void setNmem_birth(String nmem_birth) {
		this.nmem_birth = nmem_birth;
	}
	@Override
	public String toString() {
		return "NonMember [nonmember_id=" + nonmember_id + ", nmem_name=" + nmem_name + ", nmem_pw=" + nmem_pw
				+ ", nmem_tel=" + nmem_tel + ", nmem_birth=" + nmem_birth + "]";
	}
	
	
	
}
