package com.sist.web;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.EmergencyCenterDAO;
import com.sist.vo.EmergencyCenterVO;

@RestController
public class EmergencyCenterRestController {
	@Autowired
	private EmergencyCenterDAO dao;
	
	//선택 좌표 반경 5km이내 응급실 목록
	@GetMapping(value = "emergency_center/getFirst.do", produces = "text/plain;charset=UTF-8")
	public String emergency_center_list(Double baseLat, Double baseLon) {
		String json="";
		try {
			HashMap map=new HashMap();
			map.put("baseLat", baseLat);
			map.put("baseLon", baseLon);
			List<EmergencyCenterVO> list=dao.getEmergencyCenterList(map);
			JSONArray arr=new JSONArray();
			for(EmergencyCenterVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("hpid", vo.getHpid());
				obj.put("name", vo.getName());
				obj.put("addr", vo.getAddr());
				obj.put("tel", vo.getTel());
				obj.put("distance", vo.getDistance());
				obj.put("lat", vo.getLat());
				obj.put("lon", vo.getLon());
				arr.add(obj);
			}
			json=arr.toJSONString();
		}catch (Exception e) {}
		return json;
	}
}
