package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.EmergencyCenterMapper;
import com.sist.vo.EmergencyCenterDetailVO;
import com.sist.vo.EmergencyCenterVO;

@Repository
public class EmergencyCenterDAO {
	@Autowired
	private EmergencyCenterMapper mapper;
	
	public List<EmergencyCenterVO> getEmergencyCenterList(Map map){
		return mapper.getEmergencyCenterList(map);
	}
	
	public EmergencyCenterDetailVO getDetailFromHPID(String hpid) {
		return mapper.getDetailFromHPID(hpid);
	}
}
