package com.sist.web;
import com.sist.vo.*;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.AedDAO;
import com.sist.manager.AedManager;

@Controller
@RequestMapping("aed/")
public class AedController {
	@Autowired
	AedDAO dao;
	
	@GetMapping("find.do")
	public String aed_find(Model model,String ss,String title) 
	{
		if(ss==null)
			ss="을지로";
		
		List<AedVO> list=dao.aedListData(ss);
		
		model.addAttribute("ss",ss);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp","../aed/find.jsp");
		return "main/main";
	}
	
	@GetMapping("use.do")
	public String aed_use(Model model) 
	{
		model.addAttribute("main_jsp","../aed/use.jsp");
		return "main/main";
	}
	
	@GetMapping("youtube.do")
	public String aed_youtube(Model model) 
	{
		model.addAttribute("main_jsp","../aed/youtube.jsp");
		return "main/main";
	}
}
