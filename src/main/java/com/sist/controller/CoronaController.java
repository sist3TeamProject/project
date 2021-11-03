package com.sist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.CoronaDAO;
import com.sist.vo.Corona_ageVO;
import com.sist.vo.Corona_domesticVO;
import com.sist.vo.Corona_routeVO;
import com.sist.vo.Main_coronaVO;

@Controller
public class CoronaController {
	@Autowired
	private CoronaDAO dao;
	
    @GetMapping("corona/domestic.do")
    public String corona_domestic(Model model,String domestic)
    {
    	
    	domestic="1,440";
    	
    	Corona_domesticVO vo=dao.domesticData(domestic);
    	List<Corona_ageVO> aList=dao.ageData();
    	
    	model.addAttribute("vo",vo);
    	model.addAttribute("aList",aList);
    	model.addAttribute("main_jsp","/corona/domestic.jsp");
    	
    	return "main/main";
    }
    
    @GetMapping("corona/city.do")
    public String corona_city(Model model)
    {
    	List<Main_coronaVO> list=dao.cityListData();
    	
    	model.addAttribute("list",list);
    	model.addAttribute("main_jsp","/corona/city.jsp");
    	return "main/main";
    }
    
    @GetMapping("corona/route.do")
    public String corona_route(Model model)
    {
    	List<Corona_routeVO> list=dao.routeListData();
    	
    	model.addAttribute("list",list);
    	model.addAttribute("main_jsp","/corona/route.jsp");
    	return "main/main";
    }
    
    @GetMapping("corona/vaccine.do")
    public String corona_vaccine(Model model)
    {
    	model.addAttribute("main_jsp","/corona/vaccine.jsp");
    	return "main/main";
    }
    @GetMapping("corona/primary.do")
    public String corona_primary(Model model)
    {
    	model.addAttribute("main_jsp","/corona/primary.jsp");
    	return "main/main";
    }
    
    @GetMapping("corona/appointment.do")
    public String corona_appointment(Model model)
    {
    	model.addAttribute("main_jsp","/corona/appointment.jsp");
    	return "main/main";
    }
}
