package com.sist.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

public class ReservationDTO {

	private Integer idx;
	private Integer targetIdx;
	private String targetType;
	private Integer memberIdx;
	@Min(value = 1, message = "1 ~ 5명까지 가능합니다")
	@Max(value = 5, message = "1 ~ 5명까지 가능합니다")
	private Integer peopleNumber;
	private LocalDateTime reservationTime;
	private Integer status;
	private String title;
	private String writer;
	private String phoneNumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull(message = "예약날짜는 필수 입력 값입니다.")
	private LocalDate inputDate;
	@DateTimeFormat(pattern = "HH:mm")
	@NotNull(message = "예약시간은 필수 입력 값입니다.")
	private LocalTime inputTime;
	
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public Integer getTargetIdx() {
		return targetIdx;
	}
	public void setTargetIdx(Integer targetIdx) {
		this.targetIdx = targetIdx;
	}
	public String getTargetType() {
		return targetType;
	}
	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}
	public Integer getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(Integer memberIdx) {
		this.memberIdx = memberIdx;
	}
	public Integer getPeopleNumber() {
		return peopleNumber;
	}
	public void setPeopleNumber(Integer peopleNumber) {
		this.peopleNumber = peopleNumber;
	}
	public LocalDateTime getReservationTime() {
		return reservationTime;
	}
	public void setReservationTime(LocalDateTime reservationTime) {
		this.reservationTime = reservationTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public LocalDate getInputDate() {
		return inputDate;
	}
	public void setInputDate(LocalDate inputDate) {
		this.inputDate = inputDate;
	}
	public LocalTime getInputTime() {
		return inputTime;
	}
	public void setInputTime(LocalTime inputTime) {
		this.inputTime = inputTime;
	}
}