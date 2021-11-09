package com.sist.vo;

public class EmergencyCenterDetailVO {
	//응급실 상세 정보
	private String hpid,name,addr,tel,info,lat,lon;
	private String subjects;
	private String monday,tuesday,wednesday,thursday,friday,saturday,sunday,holiday;
	private int hvec;	//응급실
	private int hvoc;	//수술실
	private int hvncc;	//신생중환자
	private int hvicc;	//일반중환자
	private int hvgc;	//입원실
	private String hvctayn;	//CT가용
	private String hvmriayn;	//MRI가용
	private String hvangioayn;	//조영촬영기가용
	private String hvventiayn;	//인공호흡기가용
	private String hvamyn;	//구급차가용여부
	private String hv11;	//인큐베이터(보육기)
	public String getHpid() {
		return hpid;
	}
	public void setHpid(String hpid) {
		this.hpid = hpid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getSubjects() {
		return subjects;
	}
	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}
	public String getMonday() {
		return monday;
	}
	public void setMonday(String monday) {
		this.monday = monday;
	}
	public String getTuesday() {
		return tuesday;
	}
	public void setTuesday(String tuesday) {
		this.tuesday = tuesday;
	}
	public String getWednesday() {
		return wednesday;
	}
	public void setWednesday(String wednesday) {
		this.wednesday = wednesday;
	}
	public String getThursday() {
		return thursday;
	}
	public void setThursday(String thursday) {
		this.thursday = thursday;
	}
	public String getFriday() {
		return friday;
	}
	public void setFriday(String friday) {
		this.friday = friday;
	}
	public String getSaturday() {
		return saturday;
	}
	public void setSaturday(String saturday) {
		this.saturday = saturday;
	}
	public String getSunday() {
		return sunday;
	}
	public void setSunday(String sunday) {
		this.sunday = sunday;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public int getHvec() {
		return hvec;
	}
	public void setHvec(int hvec) {
		this.hvec = hvec;
	}
	public int getHvoc() {
		return hvoc;
	}
	public void setHvoc(int hvoc) {
		this.hvoc = hvoc;
	}
	public int getHvncc() {
		return hvncc;
	}
	public void setHvncc(int hvncc) {
		this.hvncc = hvncc;
	}
	public int getHvicc() {
		return hvicc;
	}
	public void setHvicc(int hvicc) {
		this.hvicc = hvicc;
	}
	public int getHvgc() {
		return hvgc;
	}
	public void setHvgc(int hvgc) {
		this.hvgc = hvgc;
	}
	public String getHvctayn() {
		return hvctayn;
	}
	public void setHvctayn(String hvctayn) {
		this.hvctayn = hvctayn;
	}
	public String getHvmriayn() {
		return hvmriayn;
	}
	public void setHvmriayn(String hvmriayn) {
		this.hvmriayn = hvmriayn;
	}
	public String getHvangioayn() {
		return hvangioayn;
	}
	public void setHvangioayn(String hvangioayn) {
		this.hvangioayn = hvangioayn;
	}
	public String getHvventiayn() {
		return hvventiayn;
	}
	public void setHvventiayn(String hvventiayn) {
		this.hvventiayn = hvventiayn;
	}
	public String getHvamyn() {
		return hvamyn;
	}
	public void setHvamyn(String hvamyn) {
		this.hvamyn = hvamyn;
	}
	public String getHv11() {
		return hv11;
	}
	public void setHv11(String hv11) {
		this.hv11 = hv11;
	}
}
