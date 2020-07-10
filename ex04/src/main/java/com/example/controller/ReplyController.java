package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.mapper.ReplyMapper;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
	@Autowired
	ReplyMapper mapper;
	
	@RequestMapping("list")
	public void list(Model model, Criteria cri) {
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.total());
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		model.addAttribute("list", mapper.list(cri));
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ReplyVO vo, RedirectAttributes rttr, Criteria cri) {
		System.out.println(vo.toString());
		rttr.addAttribute("page", cri.getPage());
		mapper.insert(vo);
		return "redirect:list";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int rno, RedirectAttributes rttr, Criteria cri) {
		//System.out.println(vo.toString());
		rttr.addAttribute("page", cri.getPage());
		mapper.delete(rno);
		return "redirect:list";
	}
}
