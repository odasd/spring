package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.example.domain.StudentsVO;

public interface MysqlMapper {
    @Select("select now()")
    public String getTime();
    public String getTime2();
    public ArrayList<StudentsVO> slist();
    public ArrayList<String> plist();
    public StudentsVO sread(String code);
}
