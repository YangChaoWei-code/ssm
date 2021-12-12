package com.ssm;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestSpringConstructor {
    public static void main(String[] args) {
        // 加载applicationContext.xml配置文件
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        // 获取配置中的adminInfo实例
        AdminInfo adminInfo = (AdminInfo) ctx.getBean("adminInfo");
//        AdminInfo adminInfo = (AdminInfo) ctx.getBean("admin");
        adminInfo.print();
    }
}
