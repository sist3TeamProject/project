package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.AedVO;

public interface AedMapper {
	@Select("SELECT org,lon,lat " 
			+ "FROM (" 
			+ "SELECT org,lon,lat,( 6371 * acos( cos( radians( 37.4097995 ) ) * cos( radians( lat) ) * cos( radians( lon ) - radians(127.128697) ) + sin( radians(37.4097995) ) * sin( radians(lat) ) ) ) AS distance " 
			+ "FROM aed "
			+ ") DATA " + 
			"WHERE DATA.distance < 3")
	public List<AedVO> aedDataList();
}
