package com.mybatis.mapper;

import com.mybatis.pojo.UserInfo;

public interface UserInfoMapper {
    // 根据用户id查询用户
    UserInfo findUserInfoById(int id);
}
