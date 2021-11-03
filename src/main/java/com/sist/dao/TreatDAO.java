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

}
