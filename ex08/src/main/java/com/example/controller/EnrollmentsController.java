package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.CoursesVO;
import com.example.domain.Criteria;
import com.example.domain.EnrollmentsVO;
import com.example.domain.PageMaker;
import com.example.mapper.CoursesMapper;
import com.example.mapper.EnrollmentsMapper;
import com.example.mapper.StudentsMapper;

@RestController
public class EnrollmentsController {
	@Autowired
	EnrollmentsMapper mapper;
	
	@RequestMapping(value="/enroll/insert", method=RequestMethod.POST)
	public int insert(EnrollmentsVO vo){
		int count=mapper.read(vo);
		if(count==0) {
		mapper.insert(vo);
		}
		return count;
	}	
	
	@RequestMapping(value="/enroll/delete", method=RequestMethod.POST)
	public void delete(EnrollmentsVO vo){
		mapper.delete(vo);
	}
	
	@RequestMapping(value="/enroll/update", method=RequestMethod.POST)
	public void update(EnrollmentsVO vo){
		mapper.update(vo);
	}
}
