package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.dto.HospitalDTO;
import com.sist.dto.ReservationDTO;

public interface ReservationMapper {

	@Insert("INSERT INTO reservation(idx, target_idx, target_type, member_idx, people_number, reservation_time, status) "
			+ "VALUES(reservation_seq.NEXTVAL,#{targetIdx},#{targetType},#{memberIdx},#{peopleNumber},#{reservationTime},#{status})")
	public int insertReservation(ReservationDTO reservationDTO);
	
	@Select({"<script>"
			+ "SELECT /*+ INDEX_DESC(reservation PK_reservation) */ "
			+ "target_idx, "
			+ "target_type, "
			+ "member_idx, "
			+ "people_number, "
			+ "reservation_time, "
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
			+ "SELECT /*+ INDEX_DESC(reservation PK_reservation) */ "
			+ "reservation.idx, "
			+ "target_idx, "
			+ "target_type, "
			+ "member_idx, "
			+ "people_number, "
			+ "reservation_time, "
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
	
	// 테스트로 추가
	@Select("SELECT /*+ INDEX_ASC(hospital PK_hospital) */ idx, name, type, phone_number, address, latitude, longitude, monday, tuesday, wednesday, thursday, friday, saturday, sunday, holiday FROM hospital WHERE address LIKE '%'||#{address}||'%' AND rownum <= 20")
	public List<HospitalDTO> searchHospital(Map<String, String> map);
}