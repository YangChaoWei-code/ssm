package com.springmvc.controller;

import com.springmvc.entity.Address;
import com.springmvc.entity.User;
import com.springmvc.entity.UserMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.net.Inet4Address;
import java.util.*;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes(value = {"user"})
public class UserController {

    @ResponseBody
    @RequestMapping("/returnJson")
    public Collection<User> returnJson(){
        Map<Integer, User> us = new HashMap<Integer, User>();
        us.put(1, new User("zhangsan", "123456",
                new Address("Jiangsu", "NanJing")));
        us.put(2, new User("lisi", "123456",
                new Address("Jiangsu", "YangZhou")));
        us.put(3, new User("wangwu", "123456",
                new Address("Jiangsu", "SuZhou")));
        return us.values();
    }

    @RequestMapping("/redirect")
    public String redirect(){
        return "redirect:/ch07/index.jsp";
    }

    @RequestMapping("/beanNameViewResolver")
    public String beanNameViewResolver(){
        return "myView";
    }

    @ModelAttribute
    public User getUser(Model model){
        User user = new User("wangwu", "123456", new Address("JiangSu",
                "SuZhou"));
        model.addAttribute("user", user);
        return user;
    }

    @RequestMapping("/sessionAttributes")
    public String sessionAttributes(ModelMap modelMap) {
        User user = new User("lisi", "123456", new Address("jiangsu",
                "yangzhou"));
        modelMap.put("user", user);
        return "success";
    }

    @RequestMapping("/modelAttribute")
    public String modelAttribute(User user){
        System.out.println(user);
        return "success";
    }

    @RequestMapping(value = "/requestMethod", method = RequestMethod.POST)
    public String requestMethod() {
        return "success";
    }

    @RequestMapping("/*/pathAnt")
    public String pathAnt(){
        System.out.println("Path Ant");
        return "success";
    }

    @RequestMapping(value = "/rest/{id}", method = RequestMethod.GET)
    public String restGet(@PathVariable("id") Integer id){
        System.out.println("Rest GET:" + id);
        return "success";
    }

    @RequestMapping(value = "/rest", method = RequestMethod.POST)
    public String restPOST(){
        System.out.println("Rest POST");
        return "success";
    }

    @RequestMapping(value = "/rest/{id}", method = RequestMethod.DELETE)
    public String restDELETE(@PathVariable("id") Integer id){
        System.out.println("Rest DELETE:" + id);
        return "redirect:/user/doTransfer";
    }

    @RequestMapping("/doTransfer")
    public String doTransfer(){
        return "success";
    }

    @RequestMapping(value = "/rest/{id}", method = RequestMethod.PUT)
    public String restPUT(@PathVariable("id") Integer id){
        System.out.println("Rest PUT:" + id);
        return "redirect:/user/doTransfer";
    }

    @RequestMapping("/pathVariable/{id}")
    public String pathVariable(@PathVariable("id") Integer id) {
        System.out.println("Path Variable:" + id);
        return "success";
    }

    @RequestMapping("/requestParam")
    public String requestParam(
        @RequestParam(value = "loginName") String loginName,
        @RequestParam(value = "loginPwd") String loginPwd){
        System.out.println("Request Param:" + loginName + " " + loginPwd);
        return "success";
    }

    @RequestMapping("/saveUser")
    public String saveUser(User user){
        System.out.println(user);
        return "success";
    }

    @RequestMapping("/getUser")
    public String getUser(UserMap uMap){
        Set set = uMap.getuMap().keySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()){
            Object keyName = iterator.next();
            User u = uMap.getuMap().get(keyName);
            System.out.println(u);
        }
        return "success";
    }

    @RequestMapping("/returnModelAndView")
    public ModelAndView returnModelAndView(){
        String viewName = "success";
        ModelAndView mv = new ModelAndView(viewName);
        User user = new User("zhangsan", "123456", new Address("jiangsu", "nanjing"));
        mv.addObject("user", user);
        return mv;
    }
}
