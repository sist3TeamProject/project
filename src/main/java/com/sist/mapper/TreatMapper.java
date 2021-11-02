package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface TreatMapper {
	@Select("SELECT no,title,poster,sub1,sub2 "
			+ "FROM emergency_treat "
			+ "ORDER BY no ASC")
	public List<TreatVO> treatListData();

}
