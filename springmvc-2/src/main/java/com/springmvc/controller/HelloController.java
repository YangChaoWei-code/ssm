package com.springmvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HelloController{

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
