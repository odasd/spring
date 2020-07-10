package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.domain.CoursesVO;
import com.example.domain.EnrollmentsVO;

public interface EnrollmentsMapper {
    public void insert(EnrollmentsVO vo);
    public int read(EnrollmentsVO vo);
    public void delete(EnrollmentsVO vo);
    public void update(EnrollmentsVO vo);
}
