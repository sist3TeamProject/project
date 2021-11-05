package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.EmergencyCenterDAO;

@Controller
public class EmergencyCenterController {
	@Autowired
	private EmergencyCenterDAO dao;
	
	@GetMapping("emergency_center/find.do")
	public String emergency_center_find(Model model) {
		model.addAttribute("main_jsp", "../emergency_center/find.jsp");
		return "main/main";
	}
	
	@GetMapping("emergency_center/detail.do")
	public String emergency_center_detail(String hpid,Model model) {
		model.addAttribute("hpid", hpid);
		model.addAttribute("main_jsp", "../emergency_center/detail.jsp");
		return "main/main";
	}
}
