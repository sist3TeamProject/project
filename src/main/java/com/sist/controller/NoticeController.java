package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.service.NoticeService;
import com.sist.vo.NoticeVO;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	
	private NoticeService service;
	
	//목록
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list",service.getList());
	}
	
	//조회
	@GetMapping("/get")
	public void get(@RequestParam("nno") int nno, Model model) {
		model.addAttribute("notice", service.get(nno));
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVO notice, RedirectAttributes rttr) {
		
		if(service.modify(notice)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/notice/list";
	
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("nno") int nno, RedirectAttributes rttr) {
		
		if(service.remove(nno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/notice/list";
		
	}
}
