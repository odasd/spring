package com.example.controller;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.mapper.MysqlMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //���� SpringJUnit4ClassRunner.class import�Ѵ�.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MysqlTest {
    @Autowired
    private MysqlMapper mapper;
    @Test
    public void getTime() { mapper.getTime(); }
    @Test
    public void getTime2() { mapper.getTime2(); }
    
    @Test
    public void slist() { 
    	mapper.slist();
    }
    
    @Test
    public void plist() { 
    	mapper.plist();
    }
    

    @Test
    public void sread() { 
    	mapper.sread("92414029");
    }
}
