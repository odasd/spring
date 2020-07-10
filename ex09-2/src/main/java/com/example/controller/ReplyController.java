package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.ReplyVO;
import com.example.mapper.BoardMapper;
import com.example.mapper.ReplyMapper;

@Controller
public class ReplyController {
	@Autowired
	ReplyMapper mapper;
	@Autowired
	BoardMapper bMapper;
	
	@RequestMapping(value="/reply/list")
	@ResponseBody
	public HashMap<String,Object> list(int bno){
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("list", mapper.list(bno));
		map.put("count", bMapper.replyCount(bno));
		return map;
	}
	
	@RequestMapping(value="/reply/insert")
	@ResponseBody
	public void insert(ReplyVO vo){
		mapper.insert(vo);
	}
	
	@RequestMapping(value="/reply/delete")
	@ResponseBody
	public void insert(int rno){
		mapper.delete(rno);
	}
	
	@RequestMapping(value="/reply/reply")
	public void reply(){
		
	}
}





