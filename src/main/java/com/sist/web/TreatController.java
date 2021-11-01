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
		model.addAttribute("main_jsp", "../emergency_treat/treat.jsp");
		return "main/main";
	}
	
	// 응급처치 개요
	@GetMapping("treat1.do")
	public String treat_treat1(Model model)
	{
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
		model.addAttribute("main_jsp", "../emergency_treat/treat3.jsp");
		return "main/main";
	}
	
	// 상황별 응급처치
	@GetMapping("treat4.do")
	public String treat_treat4(Model model)
	{
		model.addAttribute("main_jsp", "../emergency_treat/treat4.jsp");
		return "main/main";
	}
	
	

}
