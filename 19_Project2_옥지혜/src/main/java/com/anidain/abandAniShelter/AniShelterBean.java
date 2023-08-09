package com.anidain.abandAniShelter;
//보호소
public class AniShelterBean {
	
	private int care_reg_no;	// 보호소번호
	private String careNm; 		//보호소이름
	private String careTel; 	//보호소전화번호
	private String careAddr;	//보호장소
	
	public int getCare_reg_no() {
		return care_reg_no;
	}
	public void setCare_reg_no(int care_reg_no) {
		this.care_reg_no = care_reg_no;
	}
	public String getCareNm() {
		return careNm;
	}
	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}
	public String getCareTel() {
		return careTel;
	}
	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}
	public String getCareAddr() {
		return careAddr;
	}
	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}
	
	
}//AniShelterBean
