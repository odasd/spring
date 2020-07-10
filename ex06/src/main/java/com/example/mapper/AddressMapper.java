package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.example.domain.AddressVO;

public interface AddressMapper {
      
	public ArrayList<AddressVO> list();
	public void insert(AddressVO vo);
	public void update(AddressVO vo);
	public void delete(int id);
	public AddressVO read(int id);
}
