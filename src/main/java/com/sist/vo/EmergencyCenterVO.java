package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmergencyCenterVO {
	//응급실 기본 정보
	private int no;
	private String hpid,name,addr,tel,lat,lon;
	private Double distance;
}
