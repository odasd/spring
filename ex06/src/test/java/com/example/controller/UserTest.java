package com.example.controller;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.AddressVO;
import com.example.domain.UserVO;
import com.example.mapper.MysqlMapper;
import com.example.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //¸ÕÀú SpringJUnit4ClassRunner.class importÇÑ´Ù.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserTest {
    @Autowired
    private UserMapper mapper;
    @Test
    public void list() {
    	mapper.list(); 
    	}
    
    @Test
    public void read() {
    	mapper.read("user01"); 
    	}
    
    @Test
    public void insert() {
    	UserVO vo=new UserVO();
    	vo.setId("user04");
    	vo.setPass("pass");
    	vo.setName("¹ÚÇÑºó");
    	mapper.insert(vo);
    }
    
    
    @Test
    public void update() {
    	UserVO vo=new UserVO();
    	vo.setId("user01");
    	vo.setPass("pass");
    	vo.setName("È«±æµ¿");
    	mapper.update(vo);
    }
    
    @Test
    public void delete() {
    	mapper.delete("user04");
    }
}
