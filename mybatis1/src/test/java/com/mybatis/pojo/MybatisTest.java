package com.mybatis.pojo; 

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/** 
* UserInfo Tester. 
* 
* @author <Authors name> 
* @since <pre>3�� 16, 2021</pre> 
* @version 1.0 
*/ 
public class MybatisTest {

private SqlSessionFactory sqlSessionFactory;
private SqlSession sqlSession;

@Before
public void init() throws Exception {
    // 读取mybatis配置文件
    String resource = "mybatis-config.xml";
    InputStream inputStream;

    try {
        // 得到配置文件流
        inputStream = Resources.getResourceAsStream(resource);
        // 根据配置文件信息，创建回话工厂
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // 通过工厂得到SqlSession
        sqlSession = sqlSessionFactory.openSession();
    } catch (IOException e) {
        e.printStackTrace();
    }
}

@After
public void after() throws Exception { 
    // 提交事务
    sqlSession.commit();
    // 关闭sqlSession
    sqlSession.close();
}

    @Test
    public void testFindUserInfoById() {
        // 通过sqlSession执行映射文件中定义的SQL，并返回映射结果
        UserInfo ui = sqlSession.selectOne("findUserInfoById", 1);
        // 打印输出结果
        System.out.println(ui.toString());
    }

//根据用户名模糊查询
    @Test
    public void testFindUserInfoByUserName() {
        List<UserInfo> uis = sqlSession.selectList("findUserInfoByUserName", "m");
        for (UserInfo ui : uis
             ) {
            System.out.println(ui.toString());
        }
    }

    // 添加用户
    @Test
    public void testAddUserInfo() {
        // 创建UserInfo对象ui
        UserInfo ui = new UserInfo();
        ui.setUserName("mybatis1");
        ui.setPassword("123456");
        int result = sqlSession.insert("addUserInfo", ui);
        if (result > 0) {
            System.out.println("插入成功");
        } else {
            System.out.println("插入失败");
        }
    }

    // 修改用户
    @Test
    public void testUpdateUserInfo() {
        UserInfo ui = sqlSession.selectOne("findUserInfoById", 7);
        ui.setPassword("123123");
        int result = sqlSession.update("updateUserInfo", ui);
        if (result > 0) {
            System.out.println("更新成功");
            System.out.println(ui);
        } else {
            System.out.println("更新失败");
        }
    }

    // 删除用户
    @Test
    public void testDeleteUserInfo() {
        int result = sqlSession.delete("deleteUserInfo", 7);
        if (result > 0) {
            System.out.println("成功删除了" + result + "条记录");
        } else {
            System.out.println("插入删除");
        }
    }
} 
