package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@RestController //requestbody �ʿ����
public class UserController {

	@Autowired //mapper�� �ڵ����� ����
	UserMapper mapper; //mapper ����
	
	@RequestMapping("/user/rest/list")
	public HashMap<String, Object> list() {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", mapper.list());
		return map;
	}
	
	@RequestMapping("/user/rest/insert")
	public void insert() {
		
	}
}
