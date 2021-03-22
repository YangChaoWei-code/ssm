package com.my.controller;

import com.my.pojo.UserInfo;
import com.my.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping("/login")
    public String login(UserInfo ui) {
        UserInfo tempUi = userInfoService.login(ui.getUserName(), ui.getPassword());
        if (tempUi != null && tempUi.getUserName() != null) {
            return "index";
        } else {
            return "redirect:/login.jsp";
        }
    }
}
