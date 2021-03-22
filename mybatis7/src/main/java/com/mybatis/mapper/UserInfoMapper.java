package com.mybatis.mapper;

import com.mybatis.pojo.UserInfo;

import java.util.List;

public interface UserInfoMapper {
    List<UserInfo> findUserInfoByUserNameWithIf(UserInfo userInfo);

    List<UserInfo> findUserInfoByUserNameAndStatus(UserInfo userInfo);

    void updateUserInfo2(UserInfo userInfo);

    List<UserInfo> findUserInfoByUserNameWithIf_Trim(UserInfo userInfo);

    void updateUserInfo2_trim(UserInfo userInfo);

    List<UserInfo> findUserInfo_Choose(UserInfo userInfo);

    List<UserInfo> findUserInfoByIds(List<Integer> ids);

    List<UserInfo> findUserInfoByIds2(int[] ids);
}
