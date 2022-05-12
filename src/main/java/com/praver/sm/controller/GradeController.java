package com.praver.sm.controller;


import com.praver.sm.pojo.Grade;
import com.praver.sm.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class GradeController {

    @Autowired
    private GradeService gradeService;

    @RequestMapping("/showGrade.do")
    public String showInfo(Model model){
        List<Grade> gradeList = gradeService.queryGradeList();
        System.err.println("showGrade"+gradeList);
        model.addAttribute("gradeList",gradeList);
        return "list/gradeList";
    }

    @RequestMapping("/addGrade.do")
    public String addGrade(Grade grade){
        System.err.println(grade);
        gradeService.addGrade(grade);
        return "redirect:/showGrade.do";
    }
    @RequestMapping("/toUpdateGrade.do")
    public Object toQueryGrade(int id, Model model){
        Grade grade = gradeService.queryGrade(id);
        model.addAttribute("grade",grade);
        return "aff/updateGrade";
    }

    @RequestMapping("/updateGrade.do")
    public String updateGrade(Grade grade){
        gradeService.updateGrade(grade);
        return "redirect:/showGrade.do";
    }
    @RequestMapping("/queryGradeByName.do")
    public String queryGradeByName(String name,Model model){
        List<Grade> grade = gradeService.queryGradeByName(name);
        System.err.println("queryGradeByName" + grade );
        model.addAttribute("gradeList",grade);
        return "list/gradeList";
    }

    @RequestMapping("/deleteGrade.do")
    public String deleteGrade(int id){
        gradeService.deleteGrade(id);
        return "redirect:/showGrade.do";
    }

}
