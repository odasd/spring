package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.StudentsVO;
import com.example.mapper.MysqlMapper;

@Controller
public class StudentsController {
	@Autowired //사용하려면필요함
	MysqlMapper mapper; //mysql mapper라는 거는 다 사용 가능
	
	@RequestMapping("/slist")
	public String list(Model model) {
		model.addAttribute("slist", mapper.slist());
		return "slist";
	}
	
	
	@ResponseBody	
	@RequestMapping("/slist.json")
	public ArrayList<StudentsVO> listJSON() {
		return mapper.slist();
	}
}
