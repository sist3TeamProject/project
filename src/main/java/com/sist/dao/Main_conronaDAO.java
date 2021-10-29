package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.Main_coronaMapper;
import com.sist.vo.Main_coronaVO;

@Repository
public class Main_conronaDAO {
    @Autowired
    private Main_coronaMapper mapper;
    
    public Main_coronaVO coronaData(String city)
    {
    	return mapper.coronaData(city);
    }
}
