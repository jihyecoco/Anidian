package com.anidain.ani;

import java.sql.Date;
//유기동물
public class AniBean {
	private int no;					//일련번호
	private Date bgnde;				//유기날짜(검색 시작일)
	private String upkind;			//종류 / 축종코드
	private String state;			//상태
	private String happenPlace ;	//발견장소(우편검색과 연동된 주소)
	private String happenPlace_sub;	//발견장소(사용자입력 상세주소)
	private String kindCd;			//품종
	private String colorCd;			//색상
	private String sexCd;			//성별
	private String neuter_yn;		//중성화여부
	private String specialMark;		//특징
	private String ani_image;		//이미지
	private int care_reg_no;		//보호소번호

	//getter & setter
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getBgnde() {
		return bgnde;
	}
	public void setBgnde(Date bgnde) {
		this.bgnde = bgnde;
	}
	public String getUpkind() {
		return upkind;
	}
	public void setUpkind(String upkind) {
		this.upkind = upkind;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getHappenPlace() {
		return happenPlace;
	}
	public void setHappenPlace(String happenPlace) {
		this.happenPlace = happenPlace;
	}
	public String getHappenPlace_sub() {
		return happenPlace_sub;
	}
	public void setHappenPlace_sub(String happenPlace_sub) {
		this.happenPlace_sub = happenPlace_sub;
	}
	public String getKindCd() {
		return kindCd;
	}
	public void setKindCd(String kindCd) {
		this.kindCd = kindCd;
	}
	public String getColorCd() {
		return colorCd;
	}
	public void setColorCd(String colorCd) {
		this.colorCd = colorCd;
	}
	public String getSexCd() {
		return sexCd;
	}
	public String setSexCd(String sexCd) {
		return this.sexCd = sexCd;
	}
	public String getNeuter_yn() {
		return neuter_yn;
	}
	public void setNeuter_yn(String neuter_yn) {
		this.neuter_yn = neuter_yn;
	}
	public String getSpecialMark() {
		return specialMark;
	}
	public void setSpecialMark(String specialMark) {
		this.specialMark = specialMark;
	}
	public String getAni_image() {
		return ani_image;
	}
	public void setAni_image(String ani_image) {
		this.ani_image = ani_image;
	}
	public int getCare_reg_no() {
		return care_reg_no;
	}
	public void setCare_reg_no(int care_reg_no) {
		this.care_reg_no = care_reg_no;
	}
}//aniBean
