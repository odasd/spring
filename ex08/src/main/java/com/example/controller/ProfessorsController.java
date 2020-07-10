package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.ProfessorsMapper;

@Controller
public class ProfessorsController {
	
	@Autowired
	ProfessorsMapper mapper;
	
	@RequestMapping("/pro/plist")
	@ResponseBody
	public HashMap<String, Object> slist(String pcode){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("slist", mapper.slist(pcode));
		map.put("clist", mapper.clist(pcode));
		return map;
	}
	
	@RequestMapping("/pro/list")
	public String list(Model model){
		model.addAttribute("list", mapper.list());
		return "/pro/list";
	}
	
	
	/*
     @RequestMapping("/pro/slist")
	@ResponseBody
	public List<HashMap<String, Object>> slist(String pcode){
		return mapper.slist(pcode);
	}
	 * 
	@RequestMapping("/pro/clist")
	@ResponseBody
	public List<HashMap<String, Object>> clist(String pcode){
		return mapper.clist(pcode);
	}
	*/
}
