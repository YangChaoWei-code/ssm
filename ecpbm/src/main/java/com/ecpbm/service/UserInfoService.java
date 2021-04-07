package com.ecpbm.service;

import com.ecpbm.pojo.Pager;
import com.ecpbm.pojo.UserInfo;

import java.util.List;
import java.util.Map;

public interface UserInfoService {
    // 获取合法客户
    public List<UserInfo> getValidUser();

    // 根据客户编号查询客户
    public UserInfo getUserInfoById(int id);

    // 分页显示客户
    List<UserInfo> findUserInfo(UserInfo userInfo, Pager pager);

    // 客户计数
    Integer count(Map<String, Object> params);

    // 修改指定编号的用户状态
    void modifyStatus(String ids, int flag);
}
