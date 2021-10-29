package com.sist.web;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.Main_conronaDAO;
import com.sist.vo.Main_coronaVO;

@RestController
public class CoronaRestController {
    @Autowired
    private Main_conronaDAO dao;
    
    @GetMapping(value="main/corona_city.do",produces="text/plain;charset=UTF-8")
    public String main_corona_city(String city)
    {
 	   String json="";
 	   try
 	   {
 		   // 값을 DAO로 부터 받아 온다 (VueJS는 오라클 연결을 할 수 없다 => Spring서버를 통해서 데이터를 받는다)
 		   // JS => JS가 인식할 수 있는 데이터로 전송 (일반 데이터는 인식 , JSON , XML) => 자동파싱(JSON)
 		   // 1. 정보를 받는다 
 		   Main_coronaVO vo=dao.coronaData(city);
 		   // vo는 인식을 못한다 
 		   // java => c / c++ / c# (불가능)  => socket(네트워크를 이용해서 전송)
 		   // 카톡 ==> 서버(C) / 클라이언트 (자바)
 		   // List ==> JSONArray city,total_count,total_today,quarantine,quarantine_release,dying
 		   JSONObject obj=new JSONObject(); // VO를 자바스크립트에서 인식 
 		   obj.put("city", vo.getCity());
 		   obj.put("totalcount", vo.getTotalcount());
 		   obj.put("totaltoday", vo.getTotaltoday());
 		   obj.put("quarantine", vo.getQuarantine());
 		   obj.put("quarantinerelease", vo.getQuarantinerelease());
 		   obj.put("dying", vo.getDying());
 		   /*
 		    *    let info={"title":"","subject":""}
 		    *    info.title
 		    *    info.subject
 		    */
 		   json=obj.toJSONString();
 	   }catch(Exception ex){ex.printStackTrace();}
 	   return json;
    }
}
