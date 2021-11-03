package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CoronaMapper;
import com.sist.mapper.Main_coronaMapper;
import com.sist.vo.Corona_ageVO;
import com.sist.vo.Corona_domesticVO;
import com.sist.vo.Corona_routeVO;
import com.sist.vo.Main_coronaVO;

@Repository
public class CoronaDAO {
    @Autowired
    private CoronaMapper mapper;
    
    public Corona_domesticVO domesticData(String domestic)
    {
    	return mapper.domesticData(domestic);
    }
    
    public List<Corona_ageVO> ageData()
    {
    	return mapper.ageData();
    }
    
    public List<Corona_routeVO> routeListData()
    {
    	return mapper.routeListData();
    }
    
    public List<Main_coronaVO> cityListData()
    {
    	return mapper.cityListData();
    }
}
