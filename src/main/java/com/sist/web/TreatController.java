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
	
	@GetMapping("treat.do")
	public String treat_list(Model model)
	{
		model.addAttribute("main_jsp", "../emergency_treat/treat.jsp");
		return "main/main";
	}

}
