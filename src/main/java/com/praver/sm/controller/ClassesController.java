package com.praver.sm.controller;

import com.praver.sm.pojo.Classes;
import com.praver.sm.pojo.Grade;
import com.praver.sm.service.ClassesService;
import com.praver.sm.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;


@Controller
public class ClassesController {

    @Autowired
    private ClassesService classesService;

    @Autowired
    private GradeService gradeService;

    @RequestMapping("/showClasses.do")
    public String showClasses(Model model){
        List<Classes> classesList = classesService.getClasses();
        List<Grade> gradeList = gradeService.queryGradeList();
        model.addAttribute("classesList",classesList);
        model.addAttribute("gradeList",gradeList);
        return "list/classesList";
    }

    @RequestMapping("/addClasses.do")
    public void addClasses(@RequestBody Map<String, Object> addMap){
        System.err.println("执行添加方法！");
        classesService.addClasses(addMap);
    }

    @RequestMapping("/deleteClasses.do")
    public String deleteClasses(int id){
        classesService.deleteClasses(id);
        return "redirect:showClasses.do";
    }

    @RequestMapping("/queryClassesByName.do")
    public String queryClassesByName(int gradeid ,String queryName,Model model){
        List<Classes> classesList = classesService.queryClassesByName(gradeid, queryName);
        List<Grade> gradeList = gradeService.queryGradeList();
        model.addAttribute("classesList",classesList);
        model.addAttribute("gradeList",gradeList);
        return "list/classesList";
    }

    @RequestMapping("/toUpdateClasses.do")
    public String toUpdateClasses(int id,Model model){
        Classes classes = classesService.queryClassesById(id);
        List<Grade> gradeList = gradeService.queryGradeList();
        model.addAttribute("classes",classes);
        model.addAttribute("gradeList",gradeList);
        return "aff/updateClasses";
    }

    @RequestMapping("/updateClasses.do")
    public void updateClasses(@RequestBody Map<String, Object> map){
        System.err.println("修改成功!");
        classesService.updateClasses(map);
    }

}
