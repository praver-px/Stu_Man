package com.praver.sm.service;

import com.praver.sm.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentService {

    List<Student> getStudent();

    void addStudent(Map<String, Object> map);

    void deleteStudent(int id);

    List<Student> queryStudentByName(int classId,String name);

    Student queryStudentById(int id);

    void updateStudent(Map<String,Object> map);
}
