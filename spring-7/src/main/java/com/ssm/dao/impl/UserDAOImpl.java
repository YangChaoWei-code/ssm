package com.ssm.dao.impl;

import com.ssm.dao.UserDAO;
import com.ssm.entity.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.List;

public class UserDAOImpl implements UserDAO {
    // 声明JdbcTemplate属性及其setter方法
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // 添加用户
    @Override
    public int addUser(User user) {
        String sql="insert into user(userName,password) values(?,?)";
        // 使用数组来存储SQL语句中的参数
        Object[] object = new Object[]{user.getUserName(),
                                        user.getPassword()};
        // 执行添加操作，返回的是受SQL语句影响的记录条数
        int result = jdbcTemplate.update(sql, object);
        return result;
    }

    // 修改用户
    @Override
    public int updateUser(User user) {
        String sql="update user set userName=?,password=? where id=?";
        // 使用数组来存储SQL语句中的参数
        Object[] params = new Object[]{user.getUserName(), user.getPassword(), user.getId()};
        // 执行修改操作，返回的是受SQL语句影响的记录条数
        int result = jdbcTemplate.update(sql, params);
        return result;
    }

    // 删除用户
    @Override
    public int deleteUser(int id) {
        String sql="delete from user where id=?";
        // 执行删除操作，返回的是受SQL语句影响的记录条数
        int result=jdbcTemplate.update(sql,id);
        return result;
    }

    // 通过id查询用户信息
    @Override
    public User findUserById(int id) {
        // 定义单个查询的SQL语句
        String sql = "select * from user where id=?";
        // 创建一个新的BeanPropertyRowMapper对象，将结果集通过Java的反射机制映射到Java对象中
        RowMapper<User> rowMapper = new BeanPropertyRowMapper<User>(User.class);
        // 将id绑定到SQL语句中，并通过RowMapper返回一个Object类型的对象
        return this.jdbcTemplate.queryForObject(sql,rowMapper,id);
    }

    // 查询所有用户信息
    @Override
    public List<User> findAllUser() {
        // 定义查询所有用户的SQL语句
        String sql = "select * from User";
        // 创建一个新的BeanPropertyRowMapper对象
        RowMapper<User> rowMapper = new BeanPropertyRowMapper<User>(User.class);
        // 执行静态的SQL查询，并通过RowMapper返回结果
        return this.jdbcTemplate.query(sql, rowMapper);
    }
}
