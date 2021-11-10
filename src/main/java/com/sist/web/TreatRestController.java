package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TreatRestController {
	@Autowired
	private TreatDAO dao;
	
	@PostMapping("emergency_treat/data_update_ok.do")
	public String updata_ok(int page, Treat_DataVO vo)
	{
		
		String url="";
		
		boolean bCheck=dao.dataUpdate(vo);
		if(bCheck==true)
		{
			url="<script>"
				+"location.href=\"../emergency_treat/data_detail.do?no="+vo.getNo()+"&page="+page+"\";"
				+"</script>";
		}
		else
		{
			url="<script>"
			    +"alert(\"비밀번호가 틀립니다!!\");"
				+"history.back();"
				+"</script>";
		}
		
		return url;
	}
	
	@PostMapping("emergency_treat/data_delete_ok.do")
	public String delete_ok(int no, int page, String pwd)
	{
		String url="";
		
		boolean bCheck=dao.dataDelete(no, pwd);
		if(bCheck==true)
		{
			url="<script>"
				+"location.href=\"../emergency_treat/treat_data.do?page="+page+"\";"
				+"</script>";
		}
		else
		{
			url="<script>"
			    +"alert(\"비밀번호가 틀립니다!!\");"
				+"history.back();"
				+"</script>";
		}
		
		return url;
	}
	
	
}














