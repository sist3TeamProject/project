package com.sist.dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HospitalAppointmentDTO {

	private Integer idx;
	private Integer memberIdx;
	private String time;
	private LocalDateTime reservationTime;
	private String status;
}