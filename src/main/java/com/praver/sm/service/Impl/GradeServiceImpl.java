package com.praver.sm.service.Impl;

import com.praver.sm.mapper.GradeMapper;
import com.praver.sm.pojo.Grade;
import com.praver.sm.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {

    @Autowired
    private GradeMapper gradeMapper;

    @Override
    public int addGrade(Grade grade) {
        return gradeMapper.addGrade(grade);
    }

    @Override
    public int deleteGrade(int id) {
        return gradeMapper.deleteGrade(id);
    }

    @Override
    public List<Grade> queryGradeByName(String name) {
        return gradeMapper.queryGradeByName(name);
    }

    @Override
    public Grade queryGrade(int id) {
        return gradeMapper.queryGrade(id);
    }

    @Override
    public int updateGrade(Grade grade) {
        return gradeMapper.updateGrade(grade);
    }

    @Override
    public List<Grade> queryGradeList() {
        return gradeMapper.queryGradeList();
    }
}
