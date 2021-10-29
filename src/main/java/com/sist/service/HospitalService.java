package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dto.HospitalDTO;
import com.sist.mapper.HospitalMapper;

@Service
public class HospitalService {

	@Autowired
	private HospitalMapper hospitalMapper;

	public boolean insert(HospitalDTO hospitalDTO) {
		int sqlCheck = hospitalMapper.insertHospital(hospitalDTO);
		
		return sqlCheck == 1;
	}

	public List<HospitalDTO> searchHospital() {

		return hospitalMapper.searchHospital();
	}
}