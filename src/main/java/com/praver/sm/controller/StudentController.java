package com.praver.sm.controller;

import com.praver.sm.pojo.Classes;
import com.praver.sm.pojo.Grade;
import com.praver.sm.pojo.Student;
import com.praver.sm.pojo.Teacher;
import com.praver.sm.service.ClassesService;
import com.praver.sm.service.StudentService;
import com.praver.sm.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private ClassesService classesService;

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/showStudent.do")
    public String showStudent(Model model){
        List<Teacher> teacherList = teacherService.getTeacher();
        List<Classes> classesList = classesService.getClasses();
        List<Student> studentList = studentService.getStudent();
        model.addAttribute("classesList",classesList);
        model.addAttribute("studentList",studentList);
        model.addAttribute("teacherList",teacherList);
        return "list/studentList";
    }

    @RequestMapping("/addStudent.do")
    public void addStudent(@RequestBody Map<String,Object> map){
        studentService.addStudent(map);
    }

    @RequestMapping("/deleteStudent.do")
    public String deleteStudent(int id){
        studentService.deleteStudent(id);
        return "redirect:showStudent.do";
    }

    @RequestMapping("/queryStudentByName.do")
    public String queryStudentByName(int id,String queryName,Model model){
        List<Teacher> teacherList = teacherService.getTeacher();
        List<Classes> classesList = classesService.getClasses();
        List<Student> studentList = studentService.queryStudentByName(id, queryName);
        model.addAttribute("classesList",classesList);
        model.addAttribute("studentList",studentList);
        model.addAttribute("teacherList",teacherList);
        return "list/studentList";
    }
    @RequestMapping("/toUpdateStudent.do")
    public String toUpdateStudent(int id, Model model){
        Student student = studentService.queryStudentById(id);
        List<Teacher> teacherList = teacherService.getTeacher();
        List<Classes> classesList = classesService.getClasses();
        model.addAttribute("student",student);
        model.addAttribute("classesList",classesList);
        model.addAttribute("teacherList",teacherList);
        return "aff/updateStudent";
    }

    @RequestMapping("/updateStudent.do")
    public void updateStudent(@RequestBody Map<String, Object> map){
        studentService.updateStudent(map);
    }

}
