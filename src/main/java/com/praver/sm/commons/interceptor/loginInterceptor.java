package com.praver.sm.commons.interceptor;

import com.praver.sm.commons.Contants;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Optional;

public class loginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        String environment = Optional.ofNullable(System.getenv("environment")).orElse("dev");
//        Integer integer = Optional.ofNullable("1223").map(Integer::parseInt).orElse(123);
//
//        if (environment.equals("dev")) {
//            return true;
//        }
        HttpSession session = request.getSession();
        if (session.getAttribute(Contants.SESSION_USER) == null) {
            response.sendRedirect("/");
            return false;
        }
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
