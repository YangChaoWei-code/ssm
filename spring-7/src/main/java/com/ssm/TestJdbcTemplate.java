package com.ssm;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class TestJdbcTemplate {
    public static void main(String[] args) {
        // 初始化spring容器，加载applicationContext.xml配置
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        // 通过容器，获取JdbcTemplate的实例
        JdbcTemplate jdbcTemplate = (JdbcTemplate) ctx.getBean("jdbcTemplate");
        String sql = "create table user(id int primary key auto_increment, userName varchar(20), password varchar(32))";
        // 使用execute()方法执行SQL语句，创建用户表user
        jdbcTemplate.execute(sql);
        System.out.println("用户表user创建成功!");
    }


}
