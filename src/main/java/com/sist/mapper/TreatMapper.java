package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface TreatMapper {
	@Select("SELECT no,title,poster,sub1,sub2 "
			+ "FROM emergency_treat "
			+ "ORDER BY no ASC")
	public List<TreatVO> treatListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat1 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat1ListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat2 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat2ListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat3 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat3ListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no<=2 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no>=3 AND no<=6 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData_sna();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no>=7 AND no<=9 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData_bee();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no>=10 AND no<=11 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData_spi();

}















