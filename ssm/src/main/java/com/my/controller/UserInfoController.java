package com.my.controller;

import com.my.pojo.UserInfo;
import com.my.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/login")
    public String login(UserInfo ui) {
        UserInfo tempUi = userInfoService.login(ui.getUserName(), ui.getPassword());
        System.out.println("这里跑了。。。。。。。。。。。");
        if (tempUi != null && tempUi.getUserName() != null) {
            return "index";
        } else {
            return "redirect:/login.jsp";
        }
    }
}
