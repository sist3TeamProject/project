package com.sist.web;
import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.AedDAO;
import com.sist.manager.AedManager;

@Controller
@RequestMapping("aed/")
public class AedController {
	
	/*
	 * @Autowired private AedManager mng;
	 */
	
	@Autowired
	private AedDAO dao;
	
	@RequestMapping("find.do")
	public String aed_find(Model model,HttpServletRequest request) 
	{
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
