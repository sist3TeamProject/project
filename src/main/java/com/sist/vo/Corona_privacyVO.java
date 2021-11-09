package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * 
 * NO      NOT NULL NUMBER        
NAME             VARCHAR2(46)  
BIRTH            VARCHAR2(30)  
ADDRESS          VARCHAR2(200) 
EMAIL            VARCHAR2(100) 
RECEIVE          CHAR(1)  
 */
@Getter
@Setter
public class Corona_privacyVO {
    private int no;
    private String name,birth,address,email,receive,orgnm,regdate,time,vaccine,caddress;
}
