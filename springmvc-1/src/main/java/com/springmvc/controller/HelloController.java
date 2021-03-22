package com.springmvc.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        System.out.println("Hello,Spring MVC!"); //控制台输出
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "这是第一个Spring MVC程序!");
        mv.setViewName("/ch06/first.jsp");
        return mv;
    }
}
