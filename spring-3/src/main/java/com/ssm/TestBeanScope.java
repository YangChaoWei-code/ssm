package com.ssm;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestBeanScope {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        HelloSpring hs1 = (HelloSpring) context.getBean("helloSpring");
        HelloSpring hs2 = (HelloSpring) context.getBean("helloSpring");
        System.out.println(hs1 == hs2); //scope="singleton" true
//        System.out.println(hs1 == hs2); //scope="prototype" false
    }
}
