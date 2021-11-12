package com.sist.vo;
/*
 * IDX          NOT NULL NUMBER        
NAME         NOT NULL VARCHAR2(100) 
TYPE         NOT NULL VARCHAR2(100) 
PHONE_NUMBER NOT NULL VARCHAR2(15)  
ADDRESS      NOT NULL VARCHAR2(150) 
LATITUDE     NOT NULL VARCHAR2(30)  
LONGITUDE    NOT NULL VARCHAR2(30)  
MONDAY                VARCHAR2(100) 
TUESDAY               VARCHAR2(100) 
WEDNESDAY             VARCHAR2(100) 
THURSDAY              VARCHAR2(100) 
FRIDAY                VARCHAR2(100) 
SATURDAY              VARCHAR2(100) 
SUNDAY                VARCHAR2(100) 
HOLIDAY               VARCHAR2(100) 
 * 
 */
public class HospitalVO {
	private String IDX;
	private String NAME;
	private String TYPE;
	private String PHONENUMBER;
	private String ADDRESS;
	private String LATITUDE;
	private String LONGITUDE;
	private String MONDAY;
	private String TUESDAY;
	private String WEDNESDAY;
	private String THURSDAY;
	private String FRIDAY;
	private String SATURDAY;
	private String SUNDAY;
	private String HOLIDAY;
	private String searchKeyword;
	
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getPHONENUMBER() {
		return PHONENUMBER;
	}
	public void setPHONENUMBER(String pHONE_NUMBER) {
		PHONENUMBER = pHONE_NUMBER;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getLATITUDE() {
		return LATITUDE;
	}
	public void setLATITUDE(String lATITUDE) {
		LATITUDE = lATITUDE;
	}
	public String getLONGITUDE() {
		return LONGITUDE;
	}
	public void setLONGITUDE(String lONGITUDE) {
		LONGITUDE = lONGITUDE;
	}
	public String getMONDAY() {
		return MONDAY;
	}
	public void setMONDAY(String mONDAY) {
		MONDAY = mONDAY;
	}
	public String getTUESDAY() {
		return TUESDAY;
	}
	public void setTUESDAY(String tUESDAY) {
		TUESDAY = tUESDAY;
	}
	public String getWEDNESDAY() {
		return WEDNESDAY;
	}
	public void setWEDNESDAY(String wEDNESDAY) {
		WEDNESDAY = wEDNESDAY;
	}
	public String getTHURSDAY() {
		return THURSDAY;
	}
	public void setTHURSDAY(String tHURSDAY) {
		THURSDAY = tHURSDAY;
	}
	public String getFRIDAY() {
		return FRIDAY;
	}
	public void setFRIDAY(String fRIDAY) {
		FRIDAY = fRIDAY;
	}
	public String getSATURDAY() {
		return SATURDAY;
	}
	public void setSATURDAY(String sATURDAY) {
		SATURDAY = sATURDAY;
	}
	public String getHOLIDAY() {
		return HOLIDAY;
	}
	public void setHOLIDAY(String hOLIDAY) {
		HOLIDAY = hOLIDAY;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getSUNDAY() {
		return SUNDAY;
	}
	public void setSUNDAY(String sUNDAY) {
		SUNDAY = sUNDAY;
	}
	
	
	
}
