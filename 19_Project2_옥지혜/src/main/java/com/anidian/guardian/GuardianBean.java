package com.anidian.guardian;

public class GuardianBean {
	private int guardNo;	//보호자신청 일련번호
	private int no;			//유기동물 일련번호
	private String userId;	//신청자 아이디
	private String userPw; 	//비밀번호
	private String gender;	//성별
	private String reason;	//신청사유
	
	
	public int getGuardNo() {
		return guardNo;
	}
	public void setGuardNo(int guardNo) {
		this.guardNo = guardNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}//AnidianBean
