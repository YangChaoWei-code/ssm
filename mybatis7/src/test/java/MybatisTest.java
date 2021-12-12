
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
import java.util.ArrayList;
import java.util.List;

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

    // 测试动态SQL之<if>元素
    @Test
    public void testFindUserInfoByUserNameWithIf() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建UserInfo对象，用于封装查询条件
        UserInfo cond = new UserInfo();
        cond.setUserName("j");
        // 直接调用接口的方法，根据条件查询UserInfo对象
        List<UserInfo> uis = uim.findUserInfoByUserNameWithIf(cond);
        for (UserInfo ui : uis) {
            System.out.println(ui.toString());
        }
    }

    // 测试动态SQL之<where>、<if>元素
    @Test
    public void testFindUserInfoByUserNameAndStatus() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建UserInfo对象，用于封装查询条件
        UserInfo cond = new UserInfo();
//        cond.setUserName("j");
        cond.setStatus(1);
        // 直接调用接口的方法，根据条件查询UserInfo对象
        List<UserInfo> uis = uim.findUserInfoByUserNameAndStatus(cond);
        for (UserInfo ui : uis) {
            System.out.println(ui.toString());
        }
    }

    // 测试动态SQL之<set>、<if>元素
    @Test
    public void testUpdateUserInfo2() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建UserInfo对象，并初始化
        UserInfo cond = new UserInfo();
        cond.setId(3);
        cond.setUserName("miaoyong");
//        cond.setPassword("123123");
        // 直接调用接口的方法
        uim.updateUserInfo2(cond);
    }

    // 测试动态SQL之<trim>元素替代<where>元素
    @Test
    public void testFindUserInfoByUserNameWithIf_Trim() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建UserInfo对象，用于封装查询条件
        UserInfo cond = new UserInfo();
        cond.setUserName("j");
        cond.setStatus(1);
        // 直接调用接口的方法，根据条件查询UserInfo对象
        List<UserInfo> uis = uim.findUserInfoByUserNameWithIf_Trim(cond);
        for (UserInfo ui : uis) {
            System.out.println(ui.toString());
        }
    }

    // 测试动态SQL之<trim>元素替代<set>元素
    @Test
    public void testUpdateUserInfo2_trim() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建UserInfo对象，并初始化
        UserInfo cond = new UserInfo();
        cond.setId(3);
        cond.setUserName("miaoyong");
//        cond.setPassword("123123");
        // 直接调用接口的方法
        uim.updateUserInfo2_trim(cond);
    }

    // 测试动态SQL之<choose>、<when>和<otherwise>元素
    @Test
    public void testFindUserInfo_Choose() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建UserInfo对象，用于封装查询条件
        UserInfo cond = new UserInfo();
        cond.setUserName("j");
        cond.setStatus(1);
        // 直接调用接口的方法，根据条件查询UserInfo对象
        List<UserInfo> uis = uim.findUserInfo_Choose(cond);
        for (UserInfo ui : uis) {
            System.out.println(ui.toString());
        }
    }

    // 测试动态SQL之<foreach>元素
    @Test
    public void testFindUserInfoByIds() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建集合对象ids,保存用户id
        List<Integer> ids = new ArrayList<>();
        ids.add(1);
        ids.add(3);
        // 直接调用接口的方法
        List<UserInfo> uis = uim.findUserInfoByIds(ids);
        for (UserInfo ui : uis) {
            System.out.println(ui);
        }
    }

    @Test
    public void testFindUserInfoByIds2() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper uim = sqlSession.getMapper(UserInfoMapper.class);
        // 创建集合对象ids,保存用户id
        int[] ids = new int[2];
        ids[0] = 1;
        ids[1] = 3;
        // 直接调用接口的方法
        List<UserInfo> uis = uim.findUserInfoByIds2(ids);
        for (UserInfo ui : uis) {
            System.out.println(ui);
        }
    }
}
