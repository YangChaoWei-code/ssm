package com.mybatis.mapper;

import com.mybatis.pojo.UserInfo;

public interface UserInfoMapper {
    UserInfo findUserInfoById(int id);
}
