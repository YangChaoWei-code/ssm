import com.mybatis.mapper.UserInfoMapper;
import com.mybatis.pojo.UserInfo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    // 测试基于注解的动态SQL语句之@SelectProvider注解
    @Test
    public void testfindUserInfoByCond() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 使用Map类型对象封装查询条件
        Map<String, Object> param = new HashMap<>();
        param.put("userName", "tom");
//        param.put("password", "123456");
        // 直接调用接口的方法
        List<UserInfo> uis = uim.findUserInfoByCond(param);
        for (UserInfo ui : uis
             ) {
            // 打印输出结果
            System.out.println(ui.toString());
        }
    }

    // 测试基于注解的动态SQL语句之@InsertProvider注解
    @Test
    public void testInsertUserInfo() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建UserInfo对象并初始化
        UserInfo ui = new UserInfo();
        ui.setUserName("mybatis2");
        ui.setPassword("123456");
        // 直接调用接口的方法
        uim.insertUserInfo(ui);
        // 输出数据表user_info中新插入记录的id
        System.out.println("插入的用户编号: " + ui.getId());
    }

    // 测试基于注解的动态SQL语句之@UpdateProvider注解
    @Test
    public void testUpdateUser() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 使用Map类型对象封装查询条件
        Map<String, Object> param = new HashMap<>();
        param.put("id", "1");
        // 直接调用接口的方法,查询id为1的用户
        UserInfo ui = uim.findUserInfoByCond(param).get(0);
        // 修改该用户的密码
        ui.setPassword("666666");
        // 直接调用接口的方法，更新用户信息
        uim.updateUserInfo(ui);
    }

    // 测试基于注解的动态SQL语句之@DeleteProvider注解
    @Test
    public void testDeleteUser() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 使用Map类型对象封装查询条件
        Map<String, Object> param = new HashMap<>();
        param.put("userName", "mybatis2");
        param.put("password", "123456");
        uim.deleteUserInfo(param);
    }
} 
