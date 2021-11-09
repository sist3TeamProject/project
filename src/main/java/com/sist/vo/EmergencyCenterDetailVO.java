package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
}
