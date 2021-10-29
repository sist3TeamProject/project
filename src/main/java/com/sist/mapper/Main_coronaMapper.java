package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
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
누적 확진환자    1명
전일 대비 증감률    +1명
격리중    1명
누적격리해제    1명
사망자    1명
 */

import com.sist.vo.Main_coronaVO;
public interface Main_coronaMapper {
    @Select("SELECT city,total_count,total_today,quarantine,quarantine_release,dying "
    		+ "FROM city_by_infected "
    		+ "WHERE city=#{city}")
    public Main_coronaVO coronaData(String city);
}
