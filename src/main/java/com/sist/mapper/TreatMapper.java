package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface TreatMapper {
	@Select("SELECT no,poster,title "
			+ "FROM emergency_treat "
			+ "ORDER BY no ASC")
	public List<TreatVO> treatListData(Map map);

}
