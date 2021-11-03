package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * AGE          VARCHAR2(20) 
INFECTED     VARCHAR2(20) 
DYING        VARCHAR2(20) 
LETHALITY    VARCHAR2(20) 

 */
@Getter
@Setter
public class Corona_ageVO {
    private String age,infected,dying,lethality;
}
