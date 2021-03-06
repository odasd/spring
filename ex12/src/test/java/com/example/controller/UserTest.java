package com.example.controller;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.mapper.AccountMapper;
import com.example.mapper.MessageMapper;
import com.example.mapper.MysqlMapper;
import com.example.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //���� SpringJUnit4ClassRunner.class import�Ѵ�.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserTest {
    @Autowired
    private UserMapper mapper;
    
    @Autowired
    private MessageMapper mmapper;
    
    @Autowired
    private AccountMapper amapper;
    
    @Test
    public void alist() { 
    	amapper.list(); 
    	}
     
    @Test
    public void list() { 
    	mapper.list(); 
    	}
    
    @Test
    public void read() { 
    	mapper.read("user01"); 
    	}
    
    @Test
    public void update() { 
    	mapper.update("user01", 5); 
    	}
    
    @Test
    public void Send() { 
    	mmapper.listSend("user01"); 
    	}
    
    @Test
    public void Receive() { 
    	mmapper.listReceive("user01"); 
    	}
    }
   
