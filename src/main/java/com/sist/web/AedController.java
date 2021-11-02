package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("aed/")
public class AedController {
	@GetMapping("find.do")
	public String aed_find(Model model) 
	{
		model.addAttribute("main_jsp","../aed/find.jsp");
		return "main/main";
	}
}
