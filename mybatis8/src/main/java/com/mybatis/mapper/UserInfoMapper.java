package com.mybatis.mapper;

import com.mybatis.pojo.UserInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserInfoMapper {

    @Select("select * from user_info where id=#{id}")
    public UserInfo findUserInfoById(int id);

    @Select("select * from user_info where userName like CONCAT(CONCAT('%', #{userName}), '%')")
    public List<UserInfo> findUserInfoByUserName(String userName);

    @Insert("insert into user_info(userName, password) values(#{userName}, #{password})")
    public int addUserInfo(UserInfo userInfo);

    @Update("update user_info set userName=#{userName}, password=#{password} where id=#{id}")
    public int updateUserInfo(UserInfo userInfo);

    @Delete("delete from user_info where id=#{id}")
    public int deleteUserInfo(int id);
}
