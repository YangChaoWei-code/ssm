package com.springmvc.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取请求的URL
        String url = request.getRequestURI();
        if (!(url.contains("Login") || url.contains("login"))) {
            // 非登陆请求，获取Session，判断是否有用户数据
            if (request.getSession().getAttribute("CURRENT_USER") != null) {
                return true; // 说明已经登录，放行
            } else {    // 没有登录，则跳转到登录页面
                request.setAttribute("message", "您还没有登录，请先登录!");
                request.getRequestDispatcher("/ch11/login.jsp").forward(request, response);
            }
        } else {
            return true; // 登陆请求，放行
        }
        return false; //默认拦截
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("LoginInterceptor拦截器执行postHandle()方法");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("LoginInterceptor拦截器执行afterCompletion()方法");
    }
}
