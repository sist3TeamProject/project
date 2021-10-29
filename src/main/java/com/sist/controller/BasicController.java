package com.sist.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.role.MessageMethod;

public class BasicController {

	public String messageRedirect(String redirectUri, MessageMethod method, Map<String, Object> params, Model model) {
		if (params == null) {
			params = new HashMap<String, Object>();
		}
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("method", method);
		model.addAttribute("params", params);

		return "redirect";
	}

	public String messageRedirect(String message, String redirectUri, MessageMethod method, Map<String, Object> params,
			RedirectAttributes redirectAttributes) {
		if (params == null) {
			params = new HashMap<String, Object>();
		}

		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("redirectUri", redirectUri);
		redirectAttributes.addFlashAttribute("method", method);
		redirectAttributes.addFlashAttribute("params", params);

		return "redirect:/message.do";
	}
}
