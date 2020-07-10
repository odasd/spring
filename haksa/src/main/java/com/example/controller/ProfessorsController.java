package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.example.mapper.ProfessorsMapper;

@Controller
@RequestMapping("/professors")
public class ProfessorsController {
	@Autowired
	ProfessorsMapper mapper;
	
	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", mapper.list());
		return "/professors/list";
	}
	
	/* 다른방식 출력
	@RequestMapping("/list")
	public void list() {
		
	}
	*/
	
	@RequestMapping("/insert")
	public String insert() {
		return "/professors/insert";
	}
}
