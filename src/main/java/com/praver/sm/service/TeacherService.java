package com.praver.sm.service;

import com.praver.sm.pojo.LoginForm;
import com.praver.sm.pojo.Student;
import com.praver.sm.pojo.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TeacherService {

    List<Teacher> getTeacher();

    int addTeacher(Map<String, Object> map);

    int deleteTeacher(int id);

    Teacher queryTeacherById(int id);

    int updateTeacher(Map<String, Object> map);

    List<Teacher> queryTeacherByName(int grade, String name);

    Teacher loginTeacher(LoginForm loginForm);
}
