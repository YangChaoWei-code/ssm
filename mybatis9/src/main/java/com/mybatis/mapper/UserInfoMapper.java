package com.mybatis.mapper;

import com.mybatis.pojo.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface UserInfoMapper {
    @SelectProvider(type = UserInfoDynaSqlProvider.class, method = "selectWithParam")
    List<UserInfo> findUserInfoByCond(Map<String, Object> param);

    @InsertProvider(type = UserInfoDynaSqlProvider.class, method = "insertUserInfo")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insertUserInfo(UserInfo userInfo);

    @UpdateProvider(type = UserInfoDynaSqlProvider.class, method = "updateUserInfo")
    int updateUserInfo(UserInfo userInfo);

    @DeleteProvider(type = UserInfoDynaSqlProvider.class, method = "deleteUserInfo")
    void deleteUserInfo(Map<String, Object> param);
}
