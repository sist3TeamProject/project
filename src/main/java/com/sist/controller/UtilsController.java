package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UtilsController {

	@GetMapping("/message.do")
	public String message() {

		return "redirect";
	}
}