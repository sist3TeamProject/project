package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.dto.HospitalDTO;

public interface HospitalMapper {
	
	@SelectKey(keyProperty="idx",resultType=int.class,before=true,
			  statement="SELECT NVL(MAX(idx)+1,1) FROM hospital")
	@Insert("INSERT INTO hospital(idx, name, type, phone_number, address, latitude, longitude, monday, tuesday, wednesday, thursday, friday, saturday, sunday, holiday) VALUES(#{idx}, #{name}, #{type}, #{phoneNumber}, #{address}, #{latitude}, #{longitude}, #{monday}, #{tuesday}, #{wednesday}, #{thursday}, #{friday}, #{saturday}, #{sunday}, #{holiday})")
	public Integer insertHospital(HospitalDTO hospital);

	@Select("SELECT /*+ INDEX_ASC(hospital PK_hospital) */ idx, name, type, phone_number, address, latitude, longitude, monday, tuesday, wednesday, thursday, friday, saturday, sunday, holiday FROM hospital")
	public List<HospitalDTO> searchHospital();
}
