package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sist.dao.EmergencyCenterDAO;

@Controller
public class EmergencyCenterController {
	@Autowired
	private EmergencyCenterDAO dao;
}
