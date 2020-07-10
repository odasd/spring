package com.example.controller;



import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.AddressVO;
import com.example.mapper.AddressMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //먼저 SpringJUnit4ClassRunner.class import한다.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AddressTest {
	
    @Autowired
    private AddressMapper mapper;
    
    @Test
    public void list() {
    	mapper.list(); 
    	}
   
    @Test
    public void read() {
    	mapper.read(3);
    }
    
    @Test
    public void insert() {
    	AddressVO vo=new AddressVO();
    	vo.setName("심현아");
    	vo.setAddress("인천광역시 남동구 구월동");
    	vo.setTel("010-0000-0000");
    	mapper.insert(vo);
    }
    
    
    @Test
    public void update() {
    	AddressVO vo=new AddressVO();
    	vo.setId(4);
    	vo.setName("김나라");
    	vo.setAddress("서울");
    	vo.setTel("010-0000-0000");
    	mapper.update(vo);
    }
    
    @Test
    public void delete() {
    	mapper.delete(4);
    }
}
