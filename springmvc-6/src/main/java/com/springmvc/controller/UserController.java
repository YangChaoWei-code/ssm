package com.springmvc.controller;

import com.springmvc.entity.User;
import java.util.Locale;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {
//11.1.2基于浏览器请求的国际化实现
//    @RequestMapping(value = "/{formName}")
//    public String registerForm(@PathVariable String formName, Model model) {
//        User user = new User();
//        model.addAttribute("user", user);
//        return formName; // 动态跳转到页面
//    }

    //11.1.3基于HttpSession的国际化实现
//    @RequestMapping(value = "/{formName}")
//    public String registerForm(@PathVariable String formName, String request_locale, Model model,
//                               HttpServletRequest request) {
//        System.out.println("request_local=" + request_locale);
//        if (request_locale != null) {
//            if (request_locale.equals("zh_CN")) { // 设置中文环境
//                Locale locale = new Locale("zh", "CN");
//                request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
//            } else if (request_locale.equals("en_US")) {
//                Locale locale = new Locale("en", "US");
//                request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
//            } else { // 使用之前的语言环境
//                request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
//                        LocaleContextHolder.getLocale());
//            }
//        }
//        User user = new User();
//        model.addAttribute("user", user);
//        return formName; // 动态跳转到页面
//    }

    //11.1.4基于Cookie的国际化实现
//    @RequestMapping(value = "/{formName}")
//    public String registerForm(@PathVariable String formName, String request_locale, Model model,
//                               HttpServletRequest request, HttpServletResponse response) {
//        System.out.println("request_locale=" + request_locale);
//        if (request_locale != null) {
//            if (request_locale.equals("zh_CN")) { // 设置中文环境
//                Locale locale = new Locale("zh", "CN");
//                (new CookieLocaleResolver()).setLocale(request, response, locale);
//            } else if (request_locale.equals("en_US")) { // 设置英文环境
//                Locale locale = new Locale("en", "US");
//                (new CookieLocaleResolver()).setLocale(request, response, locale);
//            } else { // 使用之前的语言环境
//                (new CookieLocaleResolver()).setLocale(request, response, LocaleContextHolder.getLocale());
//            }
//        }
//        User user=new User();
//        model.addAttribute("user",user);
//        return formName;	//动态跳转页面
//    }

//    @RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String register(@ModelAttribute @Validated User user, Model model,
//                           HttpServletRequest request) {
//        // 从后台获取国际化资源文件中的信息userName
//        RequestContext requestContext = new RequestContext(request);
//        String username = requestContext.getMessage("userName");
//        System.out.println(username);
//        model.addAttribute("user", user);
//        return "success";
//    }

//    @RequestMapping("/hello")
//    public String hello() {
//        System.out.println("Hello!Controller控制器类执行hello()方法");
//        return "hello";
//    }

    // 向用户登录页面跳转方法
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        System.out.println("用户从login请求到登录跳转login.jsp页面");
        return "login"; //跳转到登录页面
    }

    // 用户实现登录方法
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpSession session) {
        String loginName = user.getLoginName();
        String password = user.getPassword();
        if (loginName != null && loginName.equals("yzpc") && password != null &&
                password.equals("123456")) {
            System.out.println("用户登录功能实现");
            // 将用户添加到session中保存
            session.setAttribute("CURRENT_USER", user);
            return "redirect:index"; // 重定向到主页面的跳转方法
        }
        model.addAttribute("message", "账号或密码错误，请重新登录!");
        return "login"; // 跳转到登录页面
    }

    // 向主页跳转方法
    @RequestMapping(value = "/index")
    public String indexPage() {
        System.out.println("用户从index请求到主页跳转index.jsp页面");
        return "index"; // 跳转到主页面
    }

    // 用户退出登录方法
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 清除session
        System.out.println("退出功能实现，清除session，重定向到login请求");
        return "redirect:login"; // 重定向到登录页面的跳转方法
    }
}
