package com.anidian.board;

import java.sql.Timestamp;
import java.util.Date;

public class BoardBean {
	//fields
	private int board_no;		//�Խñ� ��ȣ
	private String userId;		//���̵�
	private String userPw; 	   	//��й�ȣ
	private String subject;		//����
	private Timestamp reg_date;   	//�����
	private int readcount; 	 	//��ȸ��
	private int ref; 			//�׷�
	private int step;			//�׷� �� ����
	private int depth; 			//����
	private String content;		//����
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
		
		
}//BoardBean
