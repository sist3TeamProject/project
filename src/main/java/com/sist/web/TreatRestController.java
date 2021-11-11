package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class TreatRestController {
	@Autowired
	private TreatDAO dao;
	
	
	 @RequestMapping(value="emergency_treat/rest_data_find.do",produces="text/plain;charset=UTF-8")
    public String food_rest_find(String page, String ss)
    {
	   
	   String json="";
	   try
	   {
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);

		   Map map=new HashMap();
		   int rowSize=5;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   map.put("start", start);
		   map.put("end", end);
		   map.put("ss", ss);
		   List<Treat_DataVO> list=dao.tDataFindData(map);
		   int totalpage=dao.tDataFindTotalPage(ss);
		   

		   JSONArray arr=new JSONArray();
		   int i=0;
		   for(Treat_DataVO vo:list)
		   {
			   JSONObject obj=new JSONObject();
			   obj.put("no", vo.getNo());
			   obj.put("name", vo.getName());
			   obj.put("subject", vo.getSubject());
			   
			   if(i==0)
			   {
				   obj.put("curpage", curpage);
				   obj.put("totalpage", totalpage);
			   }
			   
			   arr.add(obj);
			   i++;
		   }
		   json=arr.toJSONString();
	   }catch(Exception ex){}
	   return json;
    }

}
