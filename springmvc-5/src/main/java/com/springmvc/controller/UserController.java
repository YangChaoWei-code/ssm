package com.springmvc.controller;

import com.springmvc.entity.User;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {

    @RequestMapping("/testValidate")
    public String testValidate(@Valid User user, BindingResult result) {
        if (result.getErrorCount() > 0) {
            for (FieldError error : result.getFieldErrors()
                 ) {
                System.out.println(error.getField() + ":" + error.getDefaultMessage());
            }
        }
        return "index";
    }

    @RequestMapping(value = "/testInitBinder")
    public String testInitBinder(User user1, Model model) {
        System.out.println("姓名: " + user1.getName());
        System.out.println("生日: " + user1.getBirthday());
        model.addAttribute("user1", user1);
        return "success1";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@ModelAttribute User user, Model model) {
        System.out.println(user.getBirthday());
        model.addAttribute("user", user);
        return "success";
    }
}
