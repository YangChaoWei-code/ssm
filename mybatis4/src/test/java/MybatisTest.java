
import com.mybatis.mapper.PersonMapper;

import com.mybatis.pojo.Person;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import java.io.IOException;
import java.io.InputStream;

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
    public void testFindPersonById(){
        //获得PerosnMapper接口的代理对象
        PersonMapper pm = sqlSession.getMapper(PersonMapper.class);
        // 直接调用接口方法，查询id=1的Person对象
        Person person = pm.findPersonById(1);
        System.out.println(person.toString());
    }
}
