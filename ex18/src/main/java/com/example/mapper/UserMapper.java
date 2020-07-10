package com.example.mapper;

import com.example.domain.UserVO;

public interface UserMapper {
	
	public UserVO read(String id);
	public void insert(UserVO vo);
}
