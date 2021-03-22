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


} 
