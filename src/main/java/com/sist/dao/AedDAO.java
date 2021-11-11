package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.AedMapper;
import com.sist.vo.AedVO;

import java.util.*;

@Repository
public class AedDAO {
	@Autowired
	private AedMapper mapper;
	
	
	public List<AedVO> aedDataList(Map map)
	{
		return mapper.aedDataList(map);
	}
}
