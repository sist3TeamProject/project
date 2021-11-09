package com.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return reservationMapper.searchReservation(map);
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
}