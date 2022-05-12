package com.praver.sm.service.Impl;

import com.praver.sm.mapper.TeacherMapper;
import com.praver.sm.pojo.LoginForm;
import com.praver.sm.pojo.Student;
import com.praver.sm.pojo.Teacher;
import com.praver.sm.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<Teacher> getTeacher() {
        return teacherMapper.getTeacher();
    }

    @Override
    public int addTeacher(Map<String, Object> map) {
        return teacherMapper.addTeacher(map);
    }

    @Override
    public int deleteTeacher(int id) {
        return teacherMapper.deleteTeacher(id);
    }

    @Override
    public Teacher queryTeacherById(int id) {
        return teacherMapper.queryTeacherById(id);
    }

    @Override
    public int updateTeacher(Map<String, Object> map) {
        return teacherMapper.updateTeacher(map);
    }

    @Override
    public List<Teacher> queryTeacherByName(int grade, String name) {
        return teacherMapper.queryTeacherByName(grade, name);
    }

    @Override
    public Teacher loginTeacher(LoginForm loginForm) {
        return teacherMapper.loginTeacher(loginForm);
    }


}
