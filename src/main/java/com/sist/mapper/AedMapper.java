package com.sist.mapper;
import com.sist.vo.*;
import java.util.*;
import org.apache.ibatis.annotations.Select;

public interface AedMapper {
	@Select("SELECT place,lat,lon FROM aed "
			+ "WHERE addr LIKE '%'||#{addr}||'%'")
	public List<AedVO> aedListData(String addr);
}
