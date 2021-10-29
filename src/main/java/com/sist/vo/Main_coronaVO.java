package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * CITY                  VARCHAR2(10) 
TOTAL_TODAY           VARCHAR2(20) 
DOMESTIC              VARCHAR2(20) 
OVERSEAS              VARCHAR2(20) 
TOTAL_COUNT           VARCHAR2(20) 
QUARANTINE            VARCHAR2(20) 
QUARANTINE_RELEASE    VARCHAR2(20) 
DYING                 VARCHAR2(20) 
INCIDENCE_RATE        VARCHAR2(20) 
 */
@Getter
@Setter
public class Main_coronaVO {
    private String city,totaltoday,domestic,overseas,totalcount,quarantine,quarantinerelease,dying,incidencerate;
    
    
}
