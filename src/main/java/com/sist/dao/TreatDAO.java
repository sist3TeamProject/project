package com.sist.dao;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TreatDAO {
	@Autowired
	private TreatMapper mapper;
	
	public List<TreatVO> treatListData()
	{
		return mapper.treatListData();
	}
	
	public List<TreatVO> treat1ListData()
	{
		return mapper.treat1ListData();
	}
	
	public List<TreatVO> treat2ListData()
	{
		return mapper.treat2ListData();
	}
	
	public List<TreatVO> treat3ListData()
	{
		return mapper.treat3ListData();
	}
	
	public List<TreatVO> treat4ListData()
	{
		return mapper.treat4ListData();
	}
	
	public List<TreatVO> treat4ListData_sna()
	{
		return mapper.treat4ListData_sna();
	}
	
	public List<TreatVO> treat4ListData_bee()
	{
		return mapper.treat4ListData_bee();
	}
	
	public List<TreatVO> treat4ListData_spi()
	{
		return mapper.treat4ListData_spi();
	}
	
	public List<TreatVO> treat4ListData_ice()
	{
		return mapper.treat4ListData_ice();
	}
	
	public List<TreatVO> treat4ListData_ice_1()
	{
		return mapper.treat4ListData_ice_1();
	}
	
	public List<Treat_DataVO> tDataListData(Map map)
	{
		return mapper.tDataListData(map);
	}
	
	public int tDataTotalPage()
	{
		return mapper.tDataTotalPage();
	}

}

















