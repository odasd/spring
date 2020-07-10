package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.mapper.BoardMapper;
import com.example.mapper.ReplyMapper;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyMapper mapper;
	
	@Autowired
	BoardMapper bmapper;
	
	
	@RequestMapping(value="/reply/list")
	@ResponseBody
	public HashMap<String, Object> list(int bno, Criteria cri, Model model, int rno){
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(bmapper.count(bno));
		model.addAttribute("pm", pm);
		
		map.put("pm", pm);
		map.put("list", mapper.list(bno, cri));
		map.put("count", bmapper.count(bno));
		return map;
	}
	
	@RequestMapping(value="/reply/insert")
	@ResponseBody//안쓰면 jsp페이지 주소로 감
	public void insert(ReplyVO vo){
		mapper.insert(vo);
	}
	
	@RequestMapping(value="/reply/delete")
	@ResponseBody//안쓰면 jsp페이지 주소로 감
	public void delete(int rno){
		mapper.delete(rno);
	}
	
	@RequestMapping(value="/reply/reply")
	public void reply() {
	}
	
	
}
