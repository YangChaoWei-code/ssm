package com.ssm;

import com.ssm.service.ProductService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestAop {
    public static void main(String[] args) {
//        初始化spring容器，加载applicationContext.xml配置
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        // 通过容器获取配置中productService的实例
        ProductService productService = (ProductService) ctx.getBean("productService");
        // 调用productService中的browse方法
        productService.browse("张三", "Lenovo 天逸 310");
    }
}
