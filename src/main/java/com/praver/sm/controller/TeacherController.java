package com.praver.sm.controller;


import com.praver.sm.pojo.Grade;
import com.praver.sm.pojo.Teacher;
import com.praver.sm.service.GradeService;
import com.praver.sm.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private GradeService gradeService;


    @RequestMapping("/showTeacher.do")
    public String showTeacher(Model model){
        List<Grade> gradeList = gradeService.queryGradeList();
        List<Teacher> teacherList = teacherService.getTeacher();
        System.err.println(teacherList);
        System.err.println(gradeList);
        model.addAttribute("teacherList",teacherList);
        model.addAttribute("gradeList",gradeList);
        return "list/teacherList";
    }

    @RequestMapping("/addTeacher.do")
    public void addTeacher(@RequestBody Map<String, Object> addMap){
        teacherService.addTeacher(addMap);
    }

    @RequestMapping("/deleteTeacher.do")
    public String delTeacher(int id){
        teacherService.deleteTeacher(id);
        return "redirect:showTeacher.do";
    }

    @RequestMapping("/toUpdateTeacher.do")
    public String toUpdateTeacher(int id,Model model){
        List<Grade> gradeList = gradeService.queryGradeList();
        Teacher teacher = teacherService.queryTeacherById(id);
        System.err.println(teacher);
        model.addAttribute("teacher",teacher);
        model.addAttribute("gradeList",gradeList);
        return "aff/updateTeacher";
    }

    @RequestMapping("/updateTeacher.do")
    public void updateTeacher(@RequestBody Map<String, Object> updateMap){
        teacherService.updateTeacher(updateMap);
    }

    @RequestMapping("/queryTeacherByName.do")
    public String queryTeacherByName(int grade,String queryName, Model model){
        System.err.println("查询数据"+grade+"\t"+queryName);
        List<Teacher> teacherList = teacherService.queryTeacherByName(grade, queryName);
        List<Grade> gradeList = gradeService.queryGradeList();
        model.addAttribute("teacherList",teacherList);
        model.addAttribute("gradeList",gradeList);
        System.err.println(teacherList);
        return "list/teacherList";
    }

}
