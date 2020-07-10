package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.MessageVO;
import com.example.mapper.MessageMapper;
import com.example.service.MessageService;

@RestController
public class MessageController {
	
	@Autowired
	MessageMapper mapper;
	
	@Autowired
	MessageService service;
	
	@RequestMapping("/list/send")
	public List<MessageVO> listSend(String id) {
		
		return mapper.listSend(id);
	}
	
	@RequestMapping("/list/receive")
	public List<MessageVO> listReceive(String id) {
		return mapper.listReceive(id);
	}
	
	@RequestMapping(value="/message/insert", method=RequestMethod.POST)
	public void insert(MessageVO vo) {
		service.insert(vo);
	}
	
	@RequestMapping("/message/read")
	public MessageVO read(int mid) {
		return service.read(mid);
	}
	
	@RequestMapping("/message/sdelete")
	public void updateSdel(int mid) {
		mapper.updateSdel(mid);
	}
	
	@RequestMapping("/message/rdelete")
	public void updateRdel(int mid) {
		mapper.updateRdel(mid);
	}
}
