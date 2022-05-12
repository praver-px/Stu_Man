package com.praver.sm.mapper;

import com.praver.sm.pojo.LoginForm;
import com.praver.sm.pojo.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TeacherMapper {

    List<Teacher>  getTeacher();

    int addTeacher(Map<String, Object> map);

    int deleteTeacher(@Param("id") int id);

    Teacher queryTeacherById(@Param("id") int id);

    int updateTeacher(Map<String, Object> map);

    List<Teacher> queryTeacherByName(@Param("id")int grade,@Param("name") String name);

    Teacher loginTeacher(LoginForm loginForm);
}
