package com.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dto.HospitalDTO;
import com.sist.dto.ReservationDTO;
import com.sist.mapper.ReservationMapper;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationMapper reservationMapper;

	public boolean insertReservation(ReservationDTO reservationDTO) {
		return (reservationMapper.insertReservation(reservationDTO) > 0);
	}

	public List<ReservationDTO> searchReservation(Map<String, Object> map) {		
		List<ReservationDTO> reservationList = reservationMapper.searchReservation(map);
		int idx = reservationList.size();
		for(int i = 0; i < reservationList.size(); i++) {
			reservationList.get(i).setIdx(idx);
			idx -= 1;
		}
		return reservationList;
	}

	public List<ReservationDTO> searchReservationAdmin(Map<String, Object> map) {
		return reservationMapper.searchReservationAdmin(map);
	}

	public boolean updateReservation(int idx, int status) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("status", status);
		
		return (reservationMapper.updateReservation(map) > 0);
	}

	public boolean deleteReservation(int idx) {
		return (reservationMapper.deleteReservation(idx) > 0);
	}
	
	public List<HospitalDTO> searchHospital(String address){
		Map<String, String> map = new HashMap<String, String>();
		map.put("address", address);
		
		return reservationMapper.searchHospital(map);
	}
}