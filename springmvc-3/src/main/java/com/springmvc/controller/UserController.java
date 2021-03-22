package com.springmvc.controller;

import com.springmvc.entity.Dept;
import com.springmvc.entity.User;
import com.springmvc.validator.UserValidator;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.DataBinder;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @RequestMapping(value = "/registerForm", method = RequestMethod.GET)
    public String registerForm(Model model) {
        User user = new User();
        // 在model中添加属性user,值为user对象
        model.addAttribute("user", user);
        return "registerForm";
    }

    @InitBinder
    public void initBinder(DataBinder binder) {
        // 设置验证的类为UserValidator
        binder.setValidator(new UserValidator());
    }

    @RequestMapping(value = "/registerValidator", method = RequestMethod.POST)
    public String registerValidator(@Validated User user, Errors errors) {
        // 如果Errors对象有Field错误，重新跳回到注册页面，否则正常提交
        if (errors.hasFieldErrors()) {
            return "registerForm";
        }
        return "submit";
    }

    @RequestMapping(value = "/select", method = RequestMethod.GET)
    public String select(Model model) {
        User user = new User();
        user.setDeptId(3);
        model.addAttribute("user", user);
        // 页面展现的可选择的select下拉列表框内容
//        Map<Integer, String> deptMap = new HashMap<>();
//        deptMap.put(1, "机械工程学院");
//        deptMap.put(2, "电气工程学院");
//        deptMap.put(3, "信息工程学院");
//        deptMap.put(4, "土木工程学院");
//        model.addAttribute("deptMap", deptMap);
        List<Dept> deptList = new ArrayList<>();
        deptList.add(new Dept(1, "机械工程学院"));
        deptList.add(new Dept(2, "电气工程学院"));
        deptList.add(new Dept(3, "信息工程学院"));
        deptList.add(new Dept(4, "土木工程学院"));
        model.addAttribute("deptList", deptList);
        return "select";
    }

    @RequestMapping(value = "/radiobutton", method = RequestMethod.GET)
    public String readiobutton(Model model) {
        User user = new User();
        user.setSex("女");
        model.addAttribute("user", user);
        return "radiobutton";
    }

    @RequestMapping(value = "/checkbox", method = RequestMethod.GET)
    public String checkbox(Model model) {
        User user = new User();
        user.setReader(true);
        List<String> list = new ArrayList<>();
        list.add("Java 程序设计");
        list.add("JavaEE框架技术");
        user.setCourses(list);
        model.addAttribute("user", user);
        return "checkbox";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        User user = new User("zhangsan", "男", 23);
        //model 中添加属性command，值为user对象
        model.addAttribute("user", user);
        return "register";
    }
}
