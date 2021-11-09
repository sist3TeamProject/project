package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.AedMapper;
import com.sist.vo.AedVO;

@Repository
public class AedDAO {
	@Autowired
	AedMapper mapper;
	
	public List<AedVO> aedListData(String addr)
	{
		return mapper.aedListData(addr);
	}
}
