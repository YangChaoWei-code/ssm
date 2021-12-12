package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HelloController{
//public class HelloController implements Controller {
//    @Override
//    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
//        System.out.println("Hello,Spring MVC!"); //控制台输出
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("msg", "这是第一个Spring MVC程序!");
//        mv.setViewName("/ch06/first.jsp");
//        return mv;
//    }
    @RequestMapping(value = "/hello")
    public ModelAndView hello(){
        System.out.println("Hello,Annotation Spring MVC!");
        // 创建ModelAndView对象，该对象包含返回视图名、模型名称以及模型对象
        ModelAndView mv = new ModelAndView();
        // 添加模型数据，可以是任何POJO对象
        mv.addObject("msg", "这是基于注解的Spring MVC程序!");
        // 设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
        mv.setViewName("first");
        // 返回ModelAndView对象
        return mv;
    }
}
