package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
    ORGCD          NUMBER        
	ORGNM          VARCHAR2(100) 
	ORGTLNO        VARCHAR2(50)  
	ORGZIPADDR     VARCHAR2(200) 
	SLRYMD         NUMBER        
	DYWK           VARCHAR2(20)  
	HLDYYN         VARCHAR2(10)  
	LUNCHSTTTM     NUMBER        
	LUNCHENDTM     NUMBER        
	STTTM          NUMBER        
	ENDTM          NUMBER        
	PHZER          NUMBER        
	MODERNA        NUMBER        
	ASTRAZENECA    NUMBER        
 */
@Getter
@Setter
public class Corona_listVO {
    private int orgcd,phzer,moderna,astrazeneca;
    private String orgnm,orgtlno,orgzipaddr;
}
