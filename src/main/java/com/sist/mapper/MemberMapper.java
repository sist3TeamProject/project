package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.dto.MemberDTO;

public interface MemberMapper {
	
	@SelectKey(keyProperty="idx",resultType=int.class,before=true,
			  statement="SELECT NVL(MAX(idx)+1,1) FROM member")
	@Insert("INSERT INTO member(idx, email, nickname, password, phone_number, postcode, address, detail_address, extra_address, delete_check, lock_count, insert_time, delete_time) VALUES(#{idx}, #{email}, #{nickname}, #{password}, #{phoneNumber}, #{postcode}, #{address}, #{detailAddress}, #{extraAddress}, 'N', 0, SYSDATE, NULL)")
	public Integer insertMember(MemberDTO member);

	@Select("SELECT * FROM member WHERE idx = #{idx}")
	public MemberDTO findByIdx(Integer idx);

	@Select("SELECT * FROM member WHERE email = #{email}")
	public MemberDTO findByEmail(String email);

	@Select("SELECT COUNT(*) FROM member WHERE EXISTS(SELECT 1 FROM member WHERE email = #{email})")
	public Integer existsByEmail(String email);

	@Select("SELECT lock_count FROM member WHERE email = #{email}")
	public Integer selectLockCheck(String email);

	@Update("UPDATE member SET lock_count = 0 WHERE email = #{email}")
	public Integer updateLockReset(String email);

	@Update("UPDATE member SET lock_count = lock_count+1 WHERE email = #{email}")
	public Integer updateLockCount(String email);

	@Update("UPDATE member SET nickname = #{nickname}, phone_number = #{phoneNumber}, postcode = #{postcode}, address = #{address}, detail_address = #{detailAddress}, extra_address = #{extraAddress} WHERE idx = #{idx}")
	public Integer updateMember(MemberDTO memberDTO);

	@Update("UPDATE member SET nickname = #{nickname}, password = #{password}, phone_number = #{phoneNumber}, postcode = #{postcode}, address = #{address}, detail_address = #{detailAddress}, extra_address = #{extraAddress} WHERE idx = #{idx}")
	public Integer updateMemberAll(MemberDTO memberDTO);

	@Update("UPDATE member SET password = #{password} WHERE email = #{email}")
	public Integer updatePassword(MemberDTO memberDTO);
	
	@Update("UPDATE member SET delete_check = #{deleteCheck}, delete_time = SYSDATE WHERE idx = #{idx}")
	public Integer deleteMember(MemberDTO memberDTO);
	

	@Select("SELECT * FROM member")
	public List<MemberDTO> find();
}
