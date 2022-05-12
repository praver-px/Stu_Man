package com.praver.sm.controller;

import com.praver.sm.commons.Contants;
import com.praver.sm.pojo.Admin;
import com.praver.sm.pojo.LoginForm;
import com.praver.sm.pojo.Teacher;
import com.praver.sm.service.AdminService;
import com.praver.sm.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class loginController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/")
    public String index(){
        return "index";
    }

    @RequestMapping("/toLogin.do")
    public String toLogin(){
        return "/system/login";
    }

    @RequestMapping("/queryLogin.do")
    public @ResponseBody Object queryLogin( String username,String password,
                                       HttpServletRequest request){
        LoginForm loginForm = new LoginForm(username,password);
        Map<String,Object> map=new HashMap<String,Object>();
        System.err.println(loginForm);
        if (adminService.loginAdmin(loginForm) != null){
            System.err.println("管理员登陆！");
            HttpSession session = request.getSession();
            session.setAttribute(Contants.SESSION_USER,adminService.loginAdmin(loginForm));
            session.setAttribute("userType",adminService.loginAdmin(loginForm).getUserType());
            map.put("code", Contants.RETURN_OBJECT_CODE_SUCCESS);
            map.put("message","请稍等正在进入首页...");
            System.err.println("管理员登陆完成!");
        }else if (teacherService.loginTeacher(loginForm) != null){
            System.err.println("教师登陆！");
            HttpSession session = request.getSession();
            session.setAttribute(Contants.SESSION_USER,teacherService.loginTeacher(loginForm));
            session.setAttribute("userType",teacherService.loginTeacher(loginForm).getUserType());
            map.put("code", Contants.RETURN_OBJECT_CODE_SUCCESS);
            map.put("message","请稍等正在进入首页...");
            System.err.println("教师登陆完成!");
        }else {
            map.put("code", Contants.RETURN_OBJECT_CODE_FAIL);
            map.put("message","账号或密码错误");
        }
        return map;
    }

    @RequestMapping("/logout.do")
    public String logout(HttpServletResponse response, HttpSession session){
        Cookie c1 = new Cookie("loginAct", null);
        Cookie c2 = new Cookie("loginPwd", null);
        c1.setMaxAge(0);
        c2.setMaxAge(0);
        response.addCookie(c1);
        response.addCookie(c2);
        session.invalidate();

        return "redirect:/";
    }
}
