package com.example.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.AddressVO;
import com.example.mapper.AddressMapper;


@Controller
public class AddressController {
	@Autowired
	AddressMapper mapper;
	
	@RequestMapping("/add/list")
	public String list(Model model) {
		model.addAttribute("list", mapper.list());
		return "/add/list";
	}
	
	@RequestMapping("/add/insert")
	public String insert() {
		return "/add/insert";
	}
	
	@RequestMapping(value="/add/insert", method=RequestMethod.POST)
	public String insertPost(AddressVO vo) {
		//System.out.println(vo.toString());
		mapper.insert(vo);
		return "redirect:list";
	}
	
	@RequestMapping("/add/read")
	public String read(int id, Model model) {
		model.addAttribute("vo", mapper.read(id));
		return "/add/read";
	}
	
	@RequestMapping(value="/add/update", method=RequestMethod.POST)
	public String updatePost(AddressVO vo) {
		//System.out.println(vo.toString());
		mapper.update(vo);
		return "redirect:list";
	}
	
	@RequestMapping(value="/add/delete", method=RequestMethod.POST)
	public String deletePost(AddressVO vo) {
		//System.out.println(vo.toString());
		mapper.delete(vo.getId());
		return "redirect:list";
	}
	
	@RequestMapping(value="/add/rest/list")
	@ResponseBody //주소가 아닌 데이터를 리턴함
	public HashMap<String, Object> test() {//해쉬맵은 키 이름과 구성내용물 구조

		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", mapper.list());
		
		return map;
	}
	
	@RequestMapping(value="/add/rest/insert", method=RequestMethod.POST)
	@ResponseBody //주소가 아닌 데이터를 리턴함
	public void restInsert(AddressVO vo) {
		mapper.insert(vo);	
	}
	
	@RequestMapping(value="/add/rest/update", method=RequestMethod.POST)
	@ResponseBody //주소가 아닌 데이터를 리턴함
	public void restUpdate(AddressVO vo) {
		mapper.update(vo);	
	}
	
	@RequestMapping(value="/add/rest/delete", method=RequestMethod.POST)
	@ResponseBody //주소가 아닌 데이터를 리턴함
	public void restDelete(int id) {
		mapper.delete(id);	
	}
	
	@RequestMapping(value="/add/rest/read/{id}", method=RequestMethod.POST) //값을 하나만 넘겨주는 방법은 2가지 삭제와 다른방식
	@ResponseBody //주소가 아닌 데이터를 리턴함
	public AddressVO restRead(@PathVariable("id") int id) {
		return mapper.read(id);	
	}
	
	@RequestMapping(value="/add/address")
	public String address() {
		return "/add/address";
	}
}
