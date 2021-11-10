package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.dto.ReservationDTO;

public interface ReservationMapper {

	@Insert("INSERT INTO reservation "
			+ "VALUES(reservation_seq.NEXTVAL,#{targetIdx},#{targetType},#{memberIdx},#{peopleNumber},#{reservationTime},#{parking},#{status})")
	public int insertReservation(ReservationDTO reservationDTO);
	
	@Select({"<script>"
			+ "SELECT "
			+ "reservation.idx, "
			+ "target_idx, "
			+ "target_type, "
			+ "member_idx, "
			+ "people_number, "
			+ "reservation_time, "
			+ "parking, "
			+ "status, "
			+ "<choose>"
			+ "<when test='targetType.equals(\"hospital\")'> "
			+ "hospital.name as title "
			+ "FROM reservation JOIN hospital "
			+ "ON target_idx = hospital.idx "
			+ "</when>"
			+ "<otherwise>"
			+ "hospital.name as title "
			+ "FROM reservation JOIN hospital "
			+ "ON target_idx = hospital.idx "
			+ "</otherwise>"
			+ "</choose>"
			+ "JOIN member "
			+ "ON member_idx = member.idx "
			+ "WHERE target_type = #{targetType} "
			+ "AND member_idx = #{memberIdx}"
			+ "</script>"})
	public List<ReservationDTO> searchReservation(Map<String, Object> map);
	
	@Select({"<script>"
			+ "SELECT "
			+ "reservation.idx, "
			+ "target_idx, "
			+ "target_type, "
			+ "member_idx, "
			+ "people_number, "
			+ "reservation_time, "
			+ "parking, "
			+ "status, "
			+ "nickname as writer, "
			+ "member.phone_number as phoneNumber, "
			+ "<choose>"
			+ "<when test='targetType.equals(\"hospital\")'> "
			+ "hospital.name as title "
			+ "FROM reservation JOIN hospital "
			+ "ON target_idx = hospital.idx "
			+ "</when>"
			+ "<otherwise>"
			+ "hospital.name as title "
			+ "FROM reservation JOIN hospital "
			+ "ON target_idx = hospital.idx "
			+ "</otherwise>"
			+ "</choose>"
			+ "JOIN member "
			+ "ON member_idx = member.idx "
			+ "WHERE target_type = #{targetType}"
			+ "</script>"})
	public List<ReservationDTO> searchReservationAdmin(Map<String, Object> map);
	
	@Update("UPDATE reservation "
			+ "SET status = #{status} "
			+ "WHERE idx = #{idx}")
	public int updateReservation(Map<String, Integer> map);
	
	@Delete("DELETE FROM "
			+ "reservation "
			+ "WHERE idx = #{idx}")
	public int deleteReservation(int idx);
}