package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.EmergencyCenterDAO;
import com.sist.manager.EmergencyCenterManager;
import com.sist.vo.EmergencyCenterDetailVO;

@Controller
public class EmergencyCenterController {
	@Autowired
	private EmergencyCenterDAO dao;
	@Autowired
	private EmergencyCenterManager mgr;
	
	@GetMapping("emergency_center/find.do")
	public String emergency_center_find(Model model) {
		model.addAttribute("main_jsp", "../emergency_center/find.jsp");
		return "main/main";
	}
	
	@GetMapping("emergency_center/detail.do")
	public String emergency_center_detail(String hpid,Model model) {
		EmergencyCenterDetailVO bvo=dao.getDetailFromHPID(hpid);
		String addr=bvo.getAddr();
		String addr1=addr.substring(0,addr.indexOf(" "));
		String addr2=addr.substring(addr.indexOf(" ")+1,addr.indexOf(" ", addr.indexOf(" ")+1));
		
		EmergencyCenterDetailVO avo=mgr.getHospitalInfo(hpid, addr1, addr2);
		avo.setHpid(hpid);
		avo.setName(bvo.getName());
		avo.setAddr(addr);
		avo.setTel(bvo.getTel());
		avo.setLat(bvo.getLat());
		avo.setLon(bvo.getLon());
		avo.setMonday(bvo.getMonday());
		avo.setTuesday(bvo.getTuesday());
		avo.setWednesday(bvo.getWednesday());
		avo.setThursday(bvo.getThursday());
		avo.setFriday(bvo.getFriday());
		avo.setSaturday(bvo.getSaturday());
		avo.setSunday(bvo.getSunday());
		avo.setHoliday(bvo.getHoliday());
		
		model.addAttribute("vo", avo);
		model.addAttribute("main_jsp", "../emergency_center/detail.jsp");
		return "main/main";
	}
}
