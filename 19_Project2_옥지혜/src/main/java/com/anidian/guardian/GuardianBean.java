package com.anidian.guardian;

public class GuardianBean {
	private int guardNo;	//��ȣ�ڽ�û �Ϸù�ȣ
	private int no;			//���⵿�� �Ϸù�ȣ
	private String userId;	//��û�� ���̵�
	private String userPw; 	//��й�ȣ
	private String gender;	//����
	private String reason;	//��û����
	
	
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
