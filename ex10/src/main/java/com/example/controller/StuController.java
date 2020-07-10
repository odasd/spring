package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.EnrollVO;
import com.example.domain.PageMaker;
import com.example.domain.StuVO;
import com.example.mapper.CouMapper;
import com.example.mapper.ProMapper;
import com.example.mapper.StuMapper;

@Controller
public class StuController {
	
	@Autowired
	StuMapper mapper;
	
	@Autowired
	ProMapper pmapper;
	
	@Autowired
	CouMapper cmapper;
	
	@RequestMapping("/stu/list")
	public void list(Criteria cri, Model model) {
		
		cri.setPerPageNum(3);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount());
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", mapper.list(cri));
		
	}
	
	@RequestMapping("/stu/read")
	public void read(String scode, Model model, int page) {
	
		model.addAttribute("vo", mapper.read(scode));
		model.addAttribute("page", page);
		model.addAttribute("plist", pmapper.plist());
		model.addAttribute("clist", cmapper.clist());
	}
	
	@RequestMapping(value="/stu/update", method=RequestMethod.POST)
	
	public String update(StuVO vo, int page) {
	
		mapper.update(vo);
		return "redirect:list?page="+page;
	}
	
	@RequestMapping(value="/stu/delete", method=RequestMethod.POST)
	
	public String delete(String scode, int page) {
	
		mapper.delete(scode);
		return "redirect:list?page="+page;
	}
	
	@RequestMapping(value="/stu/enrollCount")
	@ResponseBody
	public int enrollCount(String scode) {
		return mapper.enrollCount(scode);
	}
	
	@RequestMapping("/stu/listEnroll")
	@ResponseBody
	public HashMap<String, Object> listEnroll(String scode) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("total", mapper.enrollCount(scode));
		map.put("elist", mapper.listEnroll(scode));
		
		return map;
	}
	
	@RequestMapping(value="/stu/chart")
	public void chart(){
		
	}
	
	@RequestMapping("/stu/chartEnroll")
	@ResponseBody
	public ArrayList chartEnroll(String scode) {
		ArrayList arrayList=new ArrayList();
		ArrayList array=new ArrayList();
		array.add("과목명");
		array.add("점수");
		arrayList.add(array);
		List<EnrollVO> list=mapper.listEnroll(scode);
		for(EnrollVO vo:list) {
			array=new ArrayList();
			array.add(vo.getLname());
			array.add(vo.getGrade());
			arrayList.add(array);
		}
		return arrayList;
	}
}
