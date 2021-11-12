package com.sist.dao;
//hospitaldao
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.EmergencyCenterMapper;
import com.sist.mapper.HospitalMapper;
import com.sist.vo.EmergencyCenterDetailVO;
import com.sist.vo.EmergencyCenterVO;
import com.sist.vo.HospitalVO;

@Repository
public class HospitalDAO {
	@Autowired
	private HospitalMapper mapper;
	
	public List<HospitalVO> getHospitalList(HospitalVO hospitalVO){
		return mapper.getHospitalList(hospitalVO);
	}
	
	public HospitalVO getDetailFromHPID(HospitalVO hospitalVO) {
		return mapper.getDetailFromHPID(hospitalVO);
	}
}
