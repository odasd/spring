package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("list.json")
	@ResponseBody //이게 있으면 데이터가 리턴이 되고 없으면 페이지가 리턴
	public HashMap<String, Object> listJSON(Model model, Criteria cri, int bno) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.total(bno));
		
		map.put("pm", pm);
		
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("cri", cri);
		param.put("bno", bno);
		map.put("array", mapper.list(param));
		return map;

	}
	
	@RequestMapping("list")
	public void list(){
		
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	@ResponseBody
	public void insert(@RequestBody ReplyVO vo) {
		System.out.println(vo.toString());
		mapper.insert(vo);
		
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public void update(@RequestBody ReplyVO vo) {
		//rno값이 따로 필요함
		System.out.println(vo.toString());
		mapper.update(vo);
		
	}
	
	@RequestMapping(value="delete/{rno}", method=RequestMethod.DELETE)
	public void delete(@PathVariable("rno") int rno) {
		//System.out.println(vo.toString());
		mapper.delete(rno);
	}
}
