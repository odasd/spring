package com.example.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@Controller
public class UserController {
	@Autowired
	UserMapper mapper;
	
	@RequestMapping("/user/login")
	public void login() {
		
	}
	
	@RequestMapping("/user/insert")
	public void insert() {
		
	}
	
	@Autowired 
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping(value="/user/insert", method=RequestMethod.POST)
	public String insertPost(UserVO vo) {
		vo.setPass(passEncoder.encode(vo.getPass()));
		mapper.insert(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping("/user/logout")
	public String logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		session.invalidate();
		Cookie cookie=WebUtils.getCookie(request, "id");
		if(cookie != null) {
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public int loginPost(UserVO vo, boolean chkLogin,HttpSession session, HttpServletResponse response) {
		//System.out.println(chkLogin);
		int result=0; // id�� ���°��
		UserVO readVO=mapper.read(vo.getId());
		if(readVO != null) { // id�� �����ϴ°��
			if(passEncoder.matches(vo.getPass(), readVO.getPass())) { // �Է��� Pass, ���̺� Pass
				result=2; // id�� pass�� ��ġ
				session.setAttribute("id", vo.getId());
				if(chkLogin) {
					Cookie cookie=new Cookie("id", vo.getId());
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24*7); //������
					response.addCookie(cookie);
				}
			}else {
				result=1; // id�� pass�� ����ġ
			}
		}
		return result;
	}
	
}
