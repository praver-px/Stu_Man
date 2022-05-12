package com.praver.sm.service;

import com.praver.sm.pojo.Grade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeService {
    int addGrade(Grade grade);

    int deleteGrade(@Param("id") int id);

    Grade queryGrade(@Param("id") int id);

    int updateGrade(Grade grade);

    List<Grade> queryGradeList();

    List<Grade> queryGradeByName(@Param("name") String name);
}
