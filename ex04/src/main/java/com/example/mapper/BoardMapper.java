package com.example.mapper;

import java.util.ArrayList;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {
	
	public ArrayList<BoardVO> list(Criteria cri);
	public void insert(BoardVO vo);
	public BoardVO read(int bno);
	public void update(BoardVO vo);
	public void delete(int bno);
	public int totalCount(Criteria cri);
	
}
