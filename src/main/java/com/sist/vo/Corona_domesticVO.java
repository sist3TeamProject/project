package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * TOTAL_COUNT         VARCHAR2(20) 
TOTAL_OCCUR         VARCHAR2(20) 
DOMESTIC            VARCHAR2(20) 
OVERSEAS            VARCHAR2(20) 
RELEASE             VARCHAR2(20) 
TODAY_RELEASE       VARCHAR2(20) 
QUARANTINE          VARCHAR2(20) 
TODAY_QUARANTINE    VARCHAR2(20) 
DYING               VARCHAR2(20) 
TODAY_DYING         VARCHAR2(20) 
 */
@Getter
@Setter
public class Corona_domesticVO {
    private String totalCount,totalOccur,domestic,overseas,release,todayRelease,quarantine,todayQuarantine,dying,todayDying;
}
