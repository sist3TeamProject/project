package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmergencyCenterVO {
	private int no;
	private String hpid,name,addr,tel,emgcTel,monday,tuesday,wednesday,thursday,friday,saturday,sunday,holiday,lat,lon;
	private Double distance;
}
