package com.praver.sm.service.Impl;

import com.praver.sm.mapper.StudentMapper;
import com.praver.sm.pojo.Student;
import com.praver.sm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {



    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> getStudent() {
        return studentMapper.getStudent();
    }

    @Override
    public void addStudent(Map<String, Object> map) {
        studentMapper.addStudent(map);
    }

    @Override
    public void deleteStudent(int id) {
        studentMapper.deleteStudent(id);
    }

    @Override
    public List<Student> queryStudentByName(int classId, String name) {
        return studentMapper.queryStudentByName(classId,name);
    }

    @Override
    public Student queryStudentById(int id) {
        return studentMapper.queryStudentById(id);
    }

    @Override
    public void updateStudent(Map<String, Object> map) {
        studentMapper.updateStudent(map);
    }


}
