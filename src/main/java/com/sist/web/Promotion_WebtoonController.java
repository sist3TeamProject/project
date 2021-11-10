package com.sist.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;
import com.sist.dao.Promotion_WebtoonDAO;

import java.awt.HeadlessException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import com.sist.vo.*;

@Controller
public class Promotion_WebtoonController {
   
   @Autowired
   private Promotion_WebtoonDAO dao;
   
  
    
   @GetMapping("promotion_webtoon/list.do") // 목록을 요청했다면 => if (어노테이션 : 구분)
   public String webtoon_list(String page, Model model)
   {
	   
	   if(page==null) // 게시판늘 클릭하면 => page를 지정할 수 없기 때문에 default설정 
		   page="1";
	   int curpage=Integer.parseInt(page); // 현재페이지 => 1page
	   //int curpage=page;
	   // 1page => 1~15
	   Map map=new HashMap();
	   int rowSize=15;
	   int start=(rowSize*curpage)-(rowSize-1);
	   int end=rowSize*curpage;
	   map.put("start", start);
	   map.put("end", end);
	   List<PromotionVO> list=dao.webtoonListData(map);
	   // 총페이지 
	   int totalpage=dao.webtoonTotalPage();
	   // 페이지 => 데이터가 많은 경우 => 블록 
	   final int BLOCK=5;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
   		endPage=totalpage;
	   
	   model.addAttribute("curpage", curpage);
	   model.addAttribute("totalpage", totalpage);
	   model.addAttribute("BLOCK", BLOCK);
	   model.addAttribute("startPage", startPage);
   	   model.addAttribute("endPage", endPage);
	   model.addAttribute("list", list);
	   
	   model.addAttribute("main_jsp", "../promotion_webtoon/list.jsp");
	   return "main/main";
   }
   //상세요청
   @GetMapping("promotion_webtoon/detail.do")
   public String webtoon_detail(int no,int page,Model model)
   {
   	PromotionVO vo=dao.webtoonDetailData(no);
   	
   	if(vo.getFilecount()>0) // 오류 방지 (예외처리 => 프로그램에서 구현이 어려운 상태)
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
	    	model.addAttribute("fList", fList);// a.jpg(1000bytes)
	    	model.addAttribute("sList", sList);
   	}
   	
   	model.addAttribute("vo", vo);
   	model.addAttribute("page", page);
   	model.addAttribute("main_jsp","../promotion_webtoon/detail.jsp");
   	return "main/main";
   }
   
   @GetMapping("promotion_webtoon/insert.do")
   public String webtoon_insert(Model model)
   {
	   model.addAttribute("main_jsp", "../promotion_webtoon/insert.jsp");
	   return "main/main";
   }
   
   @PostMapping("promotion_webtoon/insert_ok.do")
   public String webtoon_insert_ok(PromotionVO vo) throws Exception
   {
	   File dir=new File("c:\\download");// 파일 업로드 저장 폴더 만들기 
   	if(!dir.exists())
   	{
   		dir.mkdir();
   	}
   	
   	// 데이터 받기 
   	// 파일 
   	List<MultipartFile> list=vo.getFiles(); // 임시 저장 장소 (파일을 이동=> c:\\download)
   	String files="";
   	String sizes="";
   	// 업로드 => NOT NULL(X) => 올린/올리지 않은 경우 
   	// 후기 게시판 , 레시피 이미지 
   	if(list!=null && list.size()>0) // 파일을 업로드 한 경우 
   	{
	    	for(MultipartFile mf:list) // download로 이동 
	    	{
	    		String fn=mf.getOriginalFilename(); // 사용자가 올린 파일명 
	    		File file=new File("c:\\download\\"+fn);
	    		mf.transferTo(file);// 업로드 라이브러리 
	    		files+=fn+","; // filename =>  a.jpg,b.jpg,c,jpg....
	    		sizes+=file.length()+","; // filesize => 1000,2000,3000,
	    	}
	    	vo.setFilename(files.substring(0,files.lastIndexOf(",")));
	    	vo.setFilesize(sizes.substring(0,sizes.lastIndexOf(",")));
	    	vo.setFilecount(list.size());
   	}
   	// /web/login/admin/1234
   	// https://sports.v.daum.net/v/20211012164726694  v?date=20211012164726694
   	// RedirectAttribute => sendRedirect
   	else // 업로드 안한 상태
   	{
   		vo.setFilename("");
   		vo.setFilesize("");
   		vo.setFilecount(0);
   	}
	   dao.webtoonInsert(vo);
	   return "redirect:../promotion_webtoon/list.do";
   }
   @GetMapping("promotion_webtoon/download.do")
   public void webtoon_download(String fn,HttpServletResponse response)
   {
   	try
   	{
   		
   		String path="c:\\download";
   		// 다운로드 창을 보여준다 (먼저 수행 => header)
   		File file=new File(path+"\\"+fn);
   		response.setContentLength((int)file.length());// 크기 (프로그래바)
   		response.setHeader("Content-Disposition", "attachment;filename="
   				     +URLEncoder.encode(fn, "UTF-8"));
   		
   		// 실제 다운로드 완료
   		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
   		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
   		byte[] buffer=new byte[1024];
   		int i=0;
   		while((i=bis.read(buffer, 0, 1024))!=-1)
   		{
   			bos.write(buffer, 0, i);
   		}
   		bis.close();
   		bos.close();
   	}catch(Exception ex){}
   }
   
   
   // 수정 
   @GetMapping("promotion_webtoon/update.do")
   public String webtoon_update(int no,int page,Model model)
   {
	   // 수정 => 이전에 입력된 데이터를 읽는다 
	   PromotionVO vo=dao.webtoonUpdateData(no);
	   model.addAttribute("vo", vo);
	   model.addAttribute("page", page);
	   model.addAttribute("main_jsp", "../promotion_webtoon/update.jsp"); //main_jsp (main.jsp중간에 첨부)
	   return "main/main";
	   
        
   }
   @PostMapping("promotion_webtoon/update_ok.do")
   public String webtoon_update_ok(int page,PromotionVO vo,Model model)
   {
   	boolean bCheck=dao.webtoonUpdate(vo);
   	
   	model.addAttribute("page", page);
   	model.addAttribute("bCheck", bCheck);
   	model.addAttribute("no", vo.getNo());
   	return "redirect:../promotion_webtoon/detail.do";
   //	return "../promotion_image/update_ok";
    //return "main/main";
   	//return "redirect:../promotion_image/list.do";
   }
   // 삭제 
   @GetMapping("promotion_webtoon/delete.do")
   public String webtoon_delete(int no,int page,Model model)
   {
	   model.addAttribute("no", no);
	   model.addAttribute("page", page);
	   model.addAttribute("main_jsp", "../promotion_webtoon/delete.jsp");
	   return "main/main";
   }
   @PostMapping("promotion_webtoon/delete_ok.do")
   public String webtoon_delete_ok(int no,int page,String pwd,Model model)
   {
   	//1. 처리 => 데이터베이스 처리 
   	PromotionVO vo=dao.webtoonFileInfoData(no); // 파일 지우기 
   	boolean bCheck=dao.webtoonDelete(no, pwd);
   	if(bCheck==true)
   	{
   		// 삭제 
   		// 저장된 파일 지운다 
   		try
   		{
   			if(vo.getFilecount()>0) //업로드된 파일이 존재
   			{
   				StringTokenizer st=new StringTokenizer(vo.getFilename(),",");
   				while(st.hasMoreTokens())
   				{
   					File file=new File("c:\\download\\"+st.nextToken());
   					file.delete();
   				}
   			}
   		}catch(Exception ex){}
   		// list.do => page
   		model.addAttribute("page", page);
   	}
   	model.addAttribute("bCheck", bCheck);
   	//2. 처리 => 업로드된 데이터 지우기 
   	//3. 결과값 전송 => boolean (true(list.do)/false(history.back())
   	//return "main/main"; // 결과값을 전송한다 
    return "redirect:../promotion_webtoon/list.do";
   }
   //찾기
   @PostMapping("promotion_webtoon/find.do")
   public String image_find(String[] fsArr,String ss,Model model)
   {
   	Map map=new HashMap();
   	map.put("fsArr", fsArr);
   	map.put("ss", ss);
   	List<PromotionVO> list=dao.webtoonFindData(map);
   	model.addAttribute("list", list);
   	model.addAttribute("main_jsp", "../promotion_webtoon/find.jsp");
   	return "main/main";
   }
   // 댓글 관련 
   // 1. 댓글 
   
}
