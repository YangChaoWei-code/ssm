
import com.mybatis.mapper.*;
import com.mybatis.pojo.*;
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

    // 根据id查询用户
    @Test
    public void testFindUserInfoById() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper um = sqlSession.getMapper(UserInfoMapper.class);
        // 直接调用接口的方法
        UserInfo ui = um.findUserInfoById(1);
        // 打印输出结果
        System.out.println(ui.toString());
    }

    // 根据用户名模糊查询用户
    @Test
    public void testFindUserInfoByUserName() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper um = sqlSession.getMapper(UserInfoMapper.class);
        // 直接调用接口的方法
        List<UserInfo> uis = um.findUserInfoByUserName("j");
        for (UserInfo ui : uis
             ) {
            // 打印输出结果
            System.out.println(ui.toString());
        }
    }

    // 添加用户
    @Test
    public void testAddUserInfo() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper um = sqlSession.getMapper(UserInfoMapper.class);
        // 创建UserInfo对象ui
        UserInfo ui = new UserInfo();
        // 向对象ui添加数据
        ui.setUserName("mybatis1");
        ui.setPassword("123456");
        // 直接调用接口的方法
        int result = um.addUserInfo(ui);
        if (result > 0) {
            System.out.println("插入成功");
        } else {
            System.out.println("插入失败");
        }
    }

    // 修改用户
    @Test
    public void testUpdateUserInfo() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper um = sqlSession.getMapper(UserInfoMapper.class);
        // 加载编号为8的用户
        UserInfo ui = um.findUserInfoById(7);
        // 重新设置用户密码
        ui.setPassword("123123");
        // 直接调用接口的方法
        int result = um.updateUserInfo(ui);
        if (result > 0) {
            System.out.println("插入成功");
            System.out.println(ui);
        } else {
            System.out.println("插入失败");
        }
    }

    // 删除用户
    @Test
    public void testDeleteUserInfo() {
        // 获得UserInfoMapper接口的代理对象
        UserInfoMapper um = sqlSession.getMapper(UserInfoMapper.class);
        // 直接调用接口的方法
        int result = um.deleteUserInfo(7);
        if (result > 0) {
            System.out.println("成功删除了" + result + "条记录");
        } else {
            System.out.println("删除失败");
        }
    }

    @Test
    public void testOne2One() {
        // 获得PersonMapper接口的代理对象
        PersonMapper pm = sqlSession.getMapper(PersonMapper.class);
        // 直接调用接口中的方法，根据id查询Person对象及关联的Idcard对象
        Person person = pm.findPersonById(1);
        // 查看Person对象及关联的Idcard对象
        System.out.println(person.toString());
    }

    @Test
    public void testOne2Many() {
        // 获得TypeMapper接口的代理对象
        TypeMapper tm = sqlSession.getMapper(TypeMapper.class);
        // 直接调用接口的方法，查询Type对象及关联的ProductInfo对象
        Type type = tm.findTypeById(1);
        System.out.println(type.toString());
    }

    @Test
    public void testMany2One() {
        // 获得PeoductInfoMapper接口的代理对象
        ProductInfoMapper pim = sqlSession.getMapper(ProductInfoMapper.class);
        // 直接调用接口的方法，查询ProductInfo对象
        ProductInfo pi = pim.findProductInfoByid(1);
        System.out.println(pi.toString());
        // 查看关联的Type对象
        System.out.println(pi.getType());
    }

    @Test
    public void testM2M() {
        // 获得AdminInfoMapper接口的代理对象
        AdminInfoMapper aim = sqlSession.getMapper(AdminInfoMapper.class);
        // 直接调用接口方法，查询AdminInfo对象及关联的Functions对象
        AdminInfo admin = aim.findAdminInfoById(1);
        System.out.println(admin);
    }
}
