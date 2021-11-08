package com.sist.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.CoronaDAO;
import com.sist.vo.*;

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
    
    
    @GetMapping("corona/primary.do")
    public String corona_primary(Model model)
    {
    	
    	model.addAttribute("main_jsp","/corona/primary.jsp");
    	return "main/main";
    }
    
    @RequestMapping("corona/list.do")
    public String corona_list(Model model,String name,String birth1,String birth2,String addr,String email,String receive,Map map,String page,String addr2,String vaccine,String post)
    {
    	if(page==null)
    		page="1";
    	
    	if(addr2==null)
    		addr2="서울";
    	if(vaccine==null)
    		vaccine="all";
    	
    	int curpage=Integer.parseInt(page);
    	int rowSize=10;
    	int start=(rowSize*curpage)-(rowSize-1);
    	int end=rowSize*curpage;
    	map.put("addr2", addr2);
    	map.put("start", start);
    	map.put("end", end);
    	List<Corona_listVO> list=dao.consignListData(map);
    	int totalpage=dao.consignTotalPage(addr2);
    	final int BLOCK=5;
    	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
    	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
    	String birth=birth1 +"-" +birth2;
    	model.addAttribute("vaccine",vaccine);
    	model.addAttribute("page", page);
    	model.addAttribute("curpage", curpage);
  	    model.addAttribute("totalpage", totalpage);
  	    model.addAttribute("startPage", startPage);
  	    model.addAttribute("endPage", endPage);
  	    model.addAttribute("BLOCK", BLOCK);
    	model.addAttribute("name",name);
    	model.addAttribute("birth",birth);
    	model.addAttribute("addr",addr);
    	model.addAttribute("receive",receive);
    	model.addAttribute("email",email);
    	model.addAttribute("post",post);
    	model.addAttribute("list",list);
    	model.addAttribute("main_jsp","/corona/list.jsp");
    	return "main/main";
    }
    
    @RequestMapping("corona/choice.do")
    public String corona_choice(Model model,String orgnm,String orgcd,String name,String birth,String addr,String email,String receive,String addr2,String post)
    {
    	model.addAttribute("orgnm",orgnm);
    	model.addAttribute("orgcd",orgcd);
    	
    	model.addAttribute("name",name);
    	model.addAttribute("birth",birth);
    	model.addAttribute("addr",addr);
    	model.addAttribute("receive",receive);
    	model.addAttribute("email",email);
    	model.addAttribute("addr2",addr2);
    	model.addAttribute("post",post);
    	model.addAttribute("main_jsp","/corona/choice.jsp");
    	return "main/main";
    }
    
    @PostMapping("corona/choice_ok.do")
    public String corona_choice_ok(Model model,String name,String birth,String addr,String email, String receive,String orgnm,String regdate,String time,String vaccine,String addr2,String orgcd,String post)
    {
    	
    	Map map=new HashMap();
    	Map map1=new HashMap();
    	map.put("name", name);
    	map.put("birth", birth);
    	map.put("address", addr);
    	map.put("email", email);
    	map.put("receive", receive);
    	map.put("orgnm", orgnm);
    	map.put("orgcd", orgcd);
    	map.put("regdate",regdate);
    	map.put("time", time);
    	map.put("vaccine", vaccine);
    	map.put("caddress", addr2);
    	map.put("post", post);
    	dao.privacyInsert(map);
    	
    	
    	map1.put("orgcd", orgcd);
    	
    	if(vaccine.equals("phzer"))
    		dao.consignPhzerUpdate(map1);
    	if(vaccine.equals("moderna"))
    		dao.consignModernaUpdate(map1);
    	if(vaccine.equals("astrazeneca"))
    		dao.consignAstraUpdate(map1);

    	return "redirect:../corona/status.do";
    }
    
    @RequestMapping("corona/status.do")
    public String corona_status(Model model)
    {
    	
    	Corona_privacyVO vo=dao.privacyData();
    	model.addAttribute("vo",vo);
    	model.addAttribute("main_jsp","/corona/status.jsp");
    	return "main/main";
    }
    
    @GetMapping("corona/user_check.do")
    public String corona_user_check(Model model)
    {
    	model.addAttribute("main_jsp","/corona/user_check.jsp");
    	return "main/main";
    }
    
    @GetMapping("corona/custom.do")
    public String corona_custom(Model model,String birth1,String birth2)
    {
    	String birth=birth1+"-"+birth2;
    	Corona_privacyVO vo= dao.privacyCustomData(birth);
    	
    	model.addAttribute("vo",vo);
    	model.addAttribute("main_jsp","/corona/custom.jsp");
    	return "main/main";
    }
    
    @RequestMapping("corona/custom_update.do")
    public String corona_update(Model model,Map map,String addr2,String vaccine,String page,int no)
    {
    	if(page==null)
    		page="1";
    	
    	if(addr2==null)
    		addr2="서울";
    	if(vaccine==null)
    		vaccine="all";
    	
    	int curpage=Integer.parseInt(page);
    	int rowSize=10;
    	int start=(rowSize*curpage)-(rowSize-1);
    	int end=rowSize*curpage;
    	map.put("addr2", addr2);
    	map.put("start", start);
    	map.put("end", end);
    	List<Corona_listVO> list=dao.consignListData(map);
    	int totalpage=dao.consignTotalPage(addr2);
    	final int BLOCK=5;
    	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
    	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
    	
    	model.addAttribute("no",no);
    	model.addAttribute("vaccine",vaccine);
    	model.addAttribute("page", page);
    	model.addAttribute("curpage", curpage);
  	    model.addAttribute("totalpage", totalpage);
  	    model.addAttribute("startPage", startPage);
  	    model.addAttribute("endPage", endPage);
  	    model.addAttribute("BLOCK", BLOCK);
    	model.addAttribute("list",list);
        model.addAttribute("main_jsp","/corona/custom_update.jsp");
        return "main/main";
    }
    
    
    @RequestMapping("corona/update_choice.do")
    public String corona_update_choice(Model model,String orgnm,String addr2,int no,String orgcd)
    {
    	model.addAttribute("no",no);
    	model.addAttribute("orgnm",orgnm);
    	model.addAttribute("orgcd",orgcd);
    	model.addAttribute("addr2",addr2);
    	model.addAttribute("main_jsp","/corona/update_choice.jsp");
    	return "main/main";
    }
    @Transactional(rollbackFor = {Exception.class})
    @PostMapping("corona/update_choice_ok.do")
    public String corona_update_choice_ok(Model model,String orgnm,String regdate,String time,String vaccine,String addr2,String orgcd,int no)
    {
    	
    	
    	Map map1=new HashMap();
    	Map map2=new HashMap();
    	
    	
    	map1.put("orgcd",orgcd);
    	if(vaccine.equals("phzer"))
    		dao.consignPhzerUpdate(map1);
    	    
    	if(vaccine.equals("moderna"))
    		dao.consignModernaUpdate(map1);
    	    
    	if(vaccine.equals("astrazeneca"))
    		dao.consignAstraUpdate(map1);
    	
    	Corona_privacyVO vo = dao.privacyCustomData2(no);
    	String orgnm2 = vo.getOrgnm();
    	String vaccine2=vo.getVaccine();
    	map2.put("orgnm", orgnm2);
    	
    	if(vaccine.equals("phzer"))
    	    dao.PhzerCancelUpdate(map2);
    	
    	if(vaccine.equals("moderna"))
    	    dao.ModernaCancelUpdate(map2);
    	
    	if(vaccine.equals("astrazeneca"))
    	    dao.AstraCancelUpdate(map2);
    	
    	
    	String caddress=addr2;
    	Corona_privacyVO vo1=new Corona_privacyVO();
    	vo1.setOrgnm(orgnm);
    	vo1.setRegdate(regdate);
    	vo1.setTime(time);
    	vo1.setVaccine(vaccine);
    	vo1.setCaddress(caddress);
    	vo1.setNo(no);
    	dao.privacyUpdate(vo1);

    	return "redirect:../corona/status.do";
    }
    
    @RequestMapping("corona/custom_delete.do")
    public String corona_delete(int no)
    {
    	dao.customeDelete(no);
    	return "redirect:../main/main.do";
    }
    
}
