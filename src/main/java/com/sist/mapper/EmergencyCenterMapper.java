package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.EmergencyCenterVO;

public interface EmergencyCenterMapper {
	@Select("SELECT hpid,name,TRUNC(distance,4) AS distance FROM " + 
			"(SELECT hpid,name,"
			+ "(6371*ACOS(COS(RADIANS(#{baseLat}))*COS(RADIANS(TRUNC(TO_NUMBER(lat),4)))*COS(RADIANS(TRUNC(TO_NUMBER(lon),4))-RADIANS(#{baseLon}))+SIN(RADIANS(#{baseLat}))*SIN(RADIANS(TRUNC(TO_NUMBER(lat),4))))) AS distance FROM emergency_center) WHERE distance<5 ORDER BY distance")
	public List<EmergencyCenterVO> getEmergencyCenterList(Map map);
	//SELECT id,FROM TEST_TABLE HAVING distance < 5 ORDER BY distance LIMIT 0 , 5;

}
