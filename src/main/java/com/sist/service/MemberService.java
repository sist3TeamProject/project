package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sist.dto.MemberDTO;
import com.sist.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public boolean signup(MemberDTO memberDTO) {
		memberDTO.setPassword(passwordEncoder.encode(memberDTO.getPassword()));
		int sqlCheck = memberMapper.insertMember(memberDTO);

		return sqlCheck == 1;
	}

	public MemberDTO searchMember(Integer idx) {
		MemberDTO memberDTO = memberMapper.findByIdx(idx);

		return memberDTO;
	}

	public MemberDTO searchMember(String email) {
		MemberDTO memberDTO = memberMapper.findByEmail(email);
		
		return memberDTO;
	}

	public boolean update(MemberDTO memberDTO) {

		return memberMapper.updateMember(memberDTO) == 1;
	}

	public boolean updateAll(MemberDTO memberDTO) {
		memberDTO.setPassword(passwordEncoder.encode(memberDTO.getPassword()));

		return memberMapper.updateMemberAll(memberDTO) == 1;
	}

	public boolean updatePassword(MemberDTO memberDTO) {
		memberDTO.setPassword(passwordEncoder.encode(memberDTO.getPassword()));
		memberMapper.updateLockReset(memberDTO.getEmail());

		return memberMapper.updatePassword(memberDTO) == 1;
	}

	public boolean delete(Integer idx) {
		MemberDTO memberDTO = searchMember(idx);
		if (memberDTO != null) {

			return memberMapper.deleteMember(memberDTO) == 1;
		}

		return false;
	}

	public boolean checkEmailDuplicate(String email) {
		
		return memberMapper.existsByEmail(email) > 0;
	}

	public int searchLock(String email) {

		return memberMapper.selectLockCheck(email);
	}

	public boolean lockReset(String email) {

		return memberMapper.updateLockReset(email) == 1;
	}

	public boolean lockCount(String email) {

		return memberMapper.updateLockCount(email) == 1;
	}
}