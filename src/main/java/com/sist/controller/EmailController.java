package com.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.EmailService;

@RestController
public class EmailController {

	@Autowired
	private EmailService emailService;

	@PostMapping("/member/emailSend")
	public Boolean emailSend(@RequestParam(value = "email") final String email) {

		return emailService.sendSimpleMessage(email);
	}

	@PostMapping("/member/emailCheck")
	public Boolean emailCheck(@RequestParam(value = "emailCode") final String emailCode) {

		return emailService.getCode().equals(emailCode);
	}
}
