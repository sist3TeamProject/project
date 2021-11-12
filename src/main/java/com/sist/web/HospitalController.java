package com.sist.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.EmergencyCenterDAO;
import com.sist.dao.HospitalDAO;
import com.sist.manager.EmergencyCenterManager;
import com.sist.vo.EmergencyCenterDetailVO;
import com.sist.vo.EmergencyCenterVO;
import com.sist.vo.HospitalVO;

@Controller
public class HospitalController {
	@Autowired
	private EmergencyCenterDAO dao;
	@Autowired
	private EmergencyCenterManager mgr;
	@Autowired
	private HospitalDAO hospitaldao;
	
	@GetMapping("hospital/find.do")
	public String hospital_find(Model model) {
		model.addAttribute("main_jsp", "../hospital/find.jsp");
		return "main/main";
	}
	
	@GetMapping("hospital/detail.do")
	public String hospital_detail(HospitalVO hospitalVo,String hpid,Model model,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		HospitalVO result = hospitaldao.getDetailFromHPID(hospitalVo);
		
		model.addAttribute("result", result);	
		model.addAttribute("main_jsp", "../hospital/detail.jsp");
		return "main/main";
	}
	
	//병원리스트
	@GetMapping("hospital/getFirst.do")
	public String hospital_list(HospitalVO hospitalVo,Model model,
			HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(">>>>>"+hospitalVo.getSearchKeyword());
		
		List<HospitalVO> resultList = hospitaldao.getHospitalList(hospitalVo);

		model.addAttribute("resultList", resultList);	
		model.addAttribute("main_jsp", "../hospital/find.jsp");
		return "main/main";
	}
}
