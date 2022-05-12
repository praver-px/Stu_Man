package com.praver.sm.mapper;

import com.praver.sm.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentMapper {

    List<Student> getStudent();

    void addStudent(Map<String, Object> map);

    void deleteStudent(@Param("id") int id);

    List<Student> queryStudentByName(@Param("classId") int classId,@Param("name") String name);

    Student queryStudentById(@Param("id") int id);

    void updateStudent(Map<String,Object> map);

}
