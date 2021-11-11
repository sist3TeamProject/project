package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.AedVO;

public interface AedMapper {
	@Select("SELECT DISTINCT org, managertel,sido,gugun,addr,place,TRUNC(lat,4) as lat,TRUNC(lon,4) as lon,TRUNC(distance,4) AS distance FROM "
			+"(SELECT org, managertel,sido,gugun,addr,place,lat,lon, "
			+"(6371*ACOS(COS(RADIANS(#{lat}))*COS(RADIANS(TRUNC(TO_NUMBER(lat),4)))*COS(RADIANS(TRUNC(TO_NUMBER(lon),4))-RADIANS(#{lon}))+SIN(RADIANS(#{lat}))*SIN(RADIANS(TRUNC(TO_NUMBER(lat),4)))))"
			+"AS distance FROM aed) WHERE distance<3 ORDER BY distance")
	public List<AedVO> aedDataList(Map map);
}