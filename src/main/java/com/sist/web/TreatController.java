package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.*;
import com.sist.dao.*;

@Controller
@RequestMapping("emergency_treat/")
public class TreatController {
	@Autowired
	private TreatDAO dao;
	
	// 리스트
	@GetMapping("list.do")
	public String treat_list(Model model)
	{
		model.addAttribute("main_jsp", "../emergency_treat/list.jsp");
		return "main/main";
	}
	
	// 응급상황시 대처요령
	@GetMapping("treat.do")
	public String treat_treat(Model model)
	{
		List<TreatVO> list=dao.treatListData();
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../emergency_treat/treat.jsp");
		return "main/main";
	}
	
	// 응급처치 개요
	@GetMapping("treat1.do")
	public String treat_treat1(Model model)
	{
		List<TreatVO> list=dao.treat1ListData();
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../emergency_treat/treat1.jsp");
		return "main/main";
	}
	
	// 응급상황
	@GetMapping("treat2.do")
	public String treat_treat2(Model model)
	{
		
		model.addAttribute("main_jsp", "../emergency_treat/treat2.jsp");
		return "main/main";
	}
	
	// 기본응급처치
	@GetMapping("treat3.do")
	public String treat_treat3(Model model)
	{
		List<TreatVO> list2=dao.treat2ListData();
		model.addAttribute("list2", list2);
		List<TreatVO> list3=dao.treat3ListData();
		model.addAttribute("list3", list3);
		model.addAttribute("main_jsp", "../emergency_treat/treat3.jsp");
		return "main/main";
	}
	
	// 상황별 응급처치
	@GetMapping("treat4.do")
	public String treat_treat4(Model model)
	{
		List<TreatVO> list4=dao.treat4ListData();
		List<TreatVO> list4_sna=dao.treat4ListData_sna();
		List<TreatVO> list4_bee=dao.treat4ListData_bee();
		List<TreatVO> list4_spi=dao.treat4ListData_spi();
		List<TreatVO> list4_ice=dao.treat4ListData_ice();
		List<TreatVO> list4_ice_1=dao.treat4ListData_ice_1();
		
		model.addAttribute("list4_sna", list4_sna);
		model.addAttribute("list4_bee", list4_bee);
		model.addAttribute("list4_spi", list4_spi);
		model.addAttribute("list4_ice", list4_ice);
		model.addAttribute("list4_ice_1", list4_ice_1);
		model.addAttribute("list4", list4);
		model.addAttribute("main_jsp", "../emergency_treat/treat4.jsp");
		return "main/main";
	}
	
	

}
