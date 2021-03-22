
import com.mybatis.mapper.ProductInfoMapper;
import com.mybatis.mapper.TypeMapper;
import com.mybatis.pojo.ProductInfo;
import com.mybatis.pojo.Type;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

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
    public void testFindTypeById() {
        // 获取TypeMapper接口的代理对象
        TypeMapper tm = sqlSession.getMapper(TypeMapper.class);
        // 直接调用接口的方法，查询id=1的Type对象
        Type type = tm.findTypeById(1);
        System.out.println(type.toString());
    }

    @Test
    public void testFindTypeById2() {
        // 获取TypeMapper接口的代理对象
        TypeMapper tm = sqlSession.getMapper(TypeMapper.class);
        // 直接调用接口的方法，查询id=1的Type对象
        Type type = tm.findTypeById2(1);
        System.out.println(type.toString());
    }

    // 添加数据
    @Test
    public void testAddType() {
        // 创建Type对象
        Type type = new Type();
        type.setName("打印机");
        // 获得TypeMapper接口的代理对象
        TypeMapper tm = sqlSession.getMapper(TypeMapper.class);
        // 直接调用接口的方法，保存Type对象
        tm.addType(type);
        // 创建两个ProductInfo对象
        ProductInfo pi1 = new ProductInfo();
        ProductInfo pi2 = new ProductInfo();
        pi1.setCode("111111");
        pi1.setName("HP1306");
        pi2.setCode("222222");
        pi2.setName("HP11103");
        // 设置关联属性
        pi1.setType(type);
        pi2.setType(type);
        // 获得ProductInfoMapper接口的代理对象
        ProductInfoMapper pm = sqlSession.getMapper(ProductInfoMapper.class);
        // 直接调用接口的方法，保存两个ProductInfo对象
        pm.addProductInfo(pi1);
        pm.addProductInfo(pi2);
    }

    // 删除数据
    @Test
    public void testDeleteTypeById() {
        // 获得TypeMapper接口的代理对象
        TypeMapper tm = sqlSession.getMapper(TypeMapper.class);
        // 直接调用接口的方法，删除编号为6的商品类型，同时删除关联的商品信息
        int result = tm.deleteTypeById(6);
        if (result > 0) {
            System.out.println("删除成功");
        } else {
            System.out.println("删除失败");
        }
    }
}
