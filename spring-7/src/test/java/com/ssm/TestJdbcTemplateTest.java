package com.ssm; 

import com.ssm.dao.UserDAO;
import com.ssm.entity.User;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/** 
* TestJdbcTemplate Tester. 
* 
* @author <Authors name> 
* @since <pre>3�� 5, 2021</pre> 
* @version 1.0 
*/ 
public class TestJdbcTemplateTest { 

@Test
public void addUserTest() {
    // ��ʼ��spring����������applicationContext.xml����
    ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
    // ͨ��Spring��������ȡUserDAO��ʵ��
    UserDAO userDAO = (UserDAO) ctx.getBean("userDAO");
    // ����user���󣬲���User�������������
    User user = new User();
    user.setUserName("yzpc");
    user.setPassword("123456");
    // ִ��addUser()����������ȡ���ؽ��
    int result = userDAO.addUser(user);
    if (result > 0) {
        System.out.println("�ɹ������ݱ��в�����" + result + "������!");
    } else {
        System.out.println("�����ݱ��в�������ʧ��!");
    }
}

@Test
public void updateUserTest() {
    // ��ʼ��spring����������applicationContext.xml����
    ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
    // ͨ��Spring��������ȡUserDAO��ʵ��
    UserDAO userDAO = (UserDAO) ctx.getBean("userDAO");
    // ����user���󣬲���User�������������
    User user = new User();
    user.setId(1);
    user.setUserName("yzpc");
    user.setPassword("123456");
    // ִ��updateUser()����������ȡ���ؽ��
    int result = userDAO.updateUser(user);
    if (result > 0) {
        System.out.println("�ɹ��޸���" + result + "������!");
    } else {
        System.out.println("�޸Ĳ���ִ��ʧ��!");
    }
}

@Test
public void deleteUserTest(){
    // ��ʼ��spring����������applicationContext.xml����
    ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
    // ͨ��Spring��������ȡUserDAO��ʵ��
    UserDAO userDAO = (UserDAO) ctx.getBean("userDAO");
    // ִ��updateUser()����������ȡ���ؽ��
    int result = userDAO.deleteUser(1);
    if (result > 0) {
        System.out.println("�ɹ�ɾ����" + result + "������!");
    } else {
        System.out.println("ɾ������ִ��ʧ��!");
    }
}

@Test
public void findUserByIdTest(){
    // ��ʼ��spring����������applicationContext.xml����
    ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
    // ͨ����������ȡUserDAO��ʵ��
    UserDAO userDAO = (UserDAO) ctx.getBean("userDAO");
    // ִ��findUserById()��������ȡUser����
    User user = userDAO.findUserById(1);
    System.out.println(user);
}

@Test
public void findAllUserTest() {
    // ��ʼ��spring����������applicationContext.xml����
    ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
    // ͨ����������ȡUserDAO��ʵ��
    UserDAO userDAO = (UserDAO) ctx.getBean("userDAO");
    // ִ��findAllUser()��������ȡUser����ļ���
    List<User> users = userDAO.findAllUser();
    // ѭ����������еĶ���
    for (User user : users
         ) {
        System.out.println(user);
    }
}
} 
