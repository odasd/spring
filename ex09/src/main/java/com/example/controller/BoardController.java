package com.example.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;


@Controller
public class BoardController {
	@Autowired
	BoardMapper mapper;
	
	@RequestMapping("/board/list")
	public String list(Criteria cri, Model model){
		
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("pm", pm);
		model.addAttribute("list", mapper.list(cri));
		return "/board/list";
	}
	
	@RequestMapping("/board/read")
	public void read(int bno, Model model){
		
		model.addAttribute("vo", mapper.read(bno));
		
		
	}
	/*
	@RequestMapping(value="/board/delete", method=RequestMethod.POST)
	public String delete(BoardVO vo, int page){
		mapper.delete(vo.getBno());
		return "redirect:list?page="+page;
	}
	*/
		
	
	@RequestMapping(value="/board/delete", method=RequestMethod.POST)
	@ResponseBody
	public int delete(int page, int bno){
		int count=mapper.count(bno);
		if(count==0) {
		mapper.delete(bno);
		}
		return count;
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String update(BoardVO vo, int page){
		mapper.update(vo);
		return "redirect:list?page="+page;
	}
	
}
