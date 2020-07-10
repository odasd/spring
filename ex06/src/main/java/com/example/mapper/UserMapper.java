package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.example.domain.UserVO;

public interface UserMapper {
      
	public ArrayList<UserVO> list();
	public void insert(UserVO vo);
	public void update(UserVO vo);
	public void delete(String id);
	public UserVO read(String id);
}
