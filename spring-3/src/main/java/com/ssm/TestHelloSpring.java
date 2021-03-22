package com.ssm;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestHelloSpring {

	public static void main(String[] args) {
		
		//初始化Spring容器，加载applicationContext.xml文件
		ApplicationContext ctx= new ClassPathXmlApplicationContext("applicationContext.xml");
		//通过容器获取配置中的helloSpring的实例
		HelloSpring helloSpring=(HelloSpring) ctx.getBean("helloSpring");
		System.out.println(helloSpring);
		helloSpring.show();

	}

}
