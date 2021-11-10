package com.sist.web;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.vo.*;
import com.sist.dao.*;

@Controller
@RequestMapping("emergency_treat/")
public class TreatController {
	@Autowired
	private TreatDAO dao;
	
	// 응급상황시 대처요령
	@GetMapping("treat.do")
	public String treat_treat(Model model)
	{
		List<TreatVO> list=dao.treatListData();
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../emergency_treat/treat.jsp");
		return "main/main";
	}
	
	// 응급처치 개요
	@GetMapping("treat1.do")
	public String treat_treat1(Model model)
	{
		List<TreatVO> list=dao.treat1ListData();
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../emergency_treat/treat1.jsp");
		return "main/main";
	}
	
	// 응급상황
	@GetMapping("treat2.do")
	public String treat_treat2(Model model)
	{
		
		model.addAttribute("main_jsp", "../emergency_treat/treat2.jsp");
		return "main/main";
	}
	
	// 기본응급처치
	@GetMapping("treat3.do")
	public String treat_treat3(Model model)
	{
		List<TreatVO> list2=dao.treat2ListData();
		model.addAttribute("list2", list2);
		List<TreatVO> list3=dao.treat3ListData();
		model.addAttribute("list3", list3);
		model.addAttribute("main_jsp", "../emergency_treat/treat3.jsp");
		return "main/main";
	}
	
	// 상황별 응급처치
	@GetMapping("treat4.do")
	public String treat_treat4(Model model)
	{
		List<TreatVO> list4=dao.treat4ListData();
		List<TreatVO> list4_sna=dao.treat4ListData_sna();
		List<TreatVO> list4_bee=dao.treat4ListData_bee();
		List<TreatVO> list4_spi=dao.treat4ListData_spi();
		List<TreatVO> list4_ice=dao.treat4ListData_ice();
		List<TreatVO> list4_ice_1=dao.treat4ListData_ice_1();
		
		model.addAttribute("list4_sna", list4_sna);
		model.addAttribute("list4_bee", list4_bee);
		model.addAttribute("list4_spi", list4_spi);
		model.addAttribute("list4_ice", list4_ice);
		model.addAttribute("list4_ice_1", list4_ice_1);
		model.addAttribute("list4", list4);
		model.addAttribute("main_jsp", "../emergency_treat/treat4.jsp");
		return "main/main";
	}
	
	@GetMapping("treat_data.do")
	public String treat_treat_data(Model model,String page)
	{
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		int rowSize=5;
		
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<Treat_DataVO> list=dao.tDataListData(map);
		int totalpage=dao.tDataTotalPage();
		
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../emergency_treat/treat_data.jsp");
		return "main/main";
	}
	
	@GetMapping("data_detail.do")
	public String data_detail(int no,Model model,int page)
	{
		Treat_DataVO vo=dao.tDataDetail(no);
		
		if(vo.getFilecount()>0)
	   	{
		    	List<String> fList=new ArrayList<String>();
		    	List<String> sList=new ArrayList<String>();
		    	
		    	StringTokenizer st1=new StringTokenizer(vo.getFilename(),",");
		    	while(st1.hasMoreTokens())
		    	{
		    		fList.add(st1.nextToken());
		    	}
		    	
		    	st1=new StringTokenizer(vo.getFilesize(),",");
		    	while(st1.hasMoreTokens())
		    	{
		    		sList.add(st1.nextToken());
		    	}
		    	model.addAttribute("fList", fList);
		    	model.addAttribute("sList", sList);
	   	}
		
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../emergency_treat/data_detail.jsp");
		return "main/main";
	}
	
	@GetMapping("data_insert.do")
	public String freeboard_insert(Model model)
	{
		model.addAttribute("main_jsp", "../emergency_treat/data_insert.jsp");
		return "main/main";
	}
	
	@PostMapping("data_insert_ok.do")
	public String data_insert_ok(Treat_DataVO vo) throws Exception
	{
		File dir=new File("c:\\download");
		if(!dir.exists())
		{
			dir.mkdir();
		}

		List<MultipartFile> list=vo.getFiles(); 
		String files="";
		String sizes="";

		if(list!=null && list.size()>0)
		{
			for(MultipartFile mf:list)
			{
				String fn=mf.getOriginalFilename();
				File file=new File("c:\\download\\"+fn);
				mf.transferTo(file);
				files+=fn+",";
				sizes+=file.length()+",";
			}
			vo.setFilename(files.substring(0,files.lastIndexOf(",")));
			vo.setFilesize(sizes.substring(0,sizes.lastIndexOf(",")));
			vo.setFilecount(list.size());
		}
		else
		{
			vo.setFilename("");
			vo.setFilesize("");
			vo.setFilecount(0);
		}
		dao.insertData(vo);
		return "redirect:treat_data.do";
	}

	@GetMapping("data_download.do")
	public void data_download(String fn,HttpServletResponse response)
	{
		try
		{
			String path="c:\\download";

			File file=new File(path+"\\"+fn);
			response.setContentLength((int)file.length());
			response.setHeader("Content-Disposition", "attachment;filename="
					+ URLEncoder.encode(fn,"UTF-8"));

			BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			
			byte[] buffer=new byte[1024];
			int i=0;
			while((i=bis.read(buffer,0,1024))!=-1)
			{
				bos.write(buffer,0,i);
			}
			bis.close();
			bos.close();
			
		}catch(Exception ex) {}
	}
	
	@GetMapping("data_update.do")
	public String data_update(int no,int page,Model model)
	{
		Treat_DataVO vo=dao.tDataDetail(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);
		model.addAttribute("main_jsp", "../emergency_treat/data_update.jsp");
		return "main/main";
	}
	
	@GetMapping("data_delete.do")
	public String data_delete(int no,int page,Model model)
	{
		model.addAttribute("no", no);
		model.addAttribute("page", page);
		model.addAttribute("main_jsp", "../emergency_treat/data_delete.jsp");
		return "main/main";
	}
	
	

}







