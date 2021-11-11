package com.sist.web;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.AedDAO;
import com.sist.vo.AedVO;

@RestController
public class AedRestController {
	
	@Autowired
	private AedDAO dao;
	
	@GetMapping(value="aed/aed_get.do",produces = "text/plain;charset=UTF-8")
	public String aed_aed_get(Double baseLat, Double baseLon)
	{
		String json="";
		
		try {

			Map map = new HashMap();
			map.put("lat", baseLat);
			map.put("lon", baseLon);
			List<AedVO> list = dao.aedDataList(map);
			
			JSONArray arr = new JSONArray();
			
			for(AedVO vo : list)
			{
				JSONObject obj = new JSONObject();
				obj.put("title", vo.getOrg());
				obj.put("lat", vo.getLat());
				obj.put("lon", vo.getLon());
				arr.add(obj);
			}
			json=arr.toJSONString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return json;
	}
}