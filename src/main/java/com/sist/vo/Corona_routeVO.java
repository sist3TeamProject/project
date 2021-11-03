package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * AREA         VARCHAR2(20)  
GU           VARCHAR2(20)  
TYPE         VARCHAR2(40)  
ADDRESS      VARCHAR2(200) 
DAY          VARCHAR2(30)  
DISINFECT    VARCHAR2(20)  
 */
@Setter
@Getter
public class Corona_routeVO {
    private String area,gu,type,address,day,disinfect;
}
