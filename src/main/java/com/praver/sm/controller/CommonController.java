package com.praver.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommonController {

    @RequestMapping("/index.do")
    public String toIndex(){
        return "system/main";
    }

}
