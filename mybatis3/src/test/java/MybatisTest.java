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

// 根据id查询用户
@Test
public void testFindUserInfoById() {
    // 获得UserInfoMapper接口的代理对象
    UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
    // 直接调用接口的方法，查询编号为1的UserInfo对象
    UserInfo ui = uim.findUserInfoById(1);
    // 打印输出结果
    System.out.println(ui.toString());
}

} 
