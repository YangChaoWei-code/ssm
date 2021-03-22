package com.my.service;

import com.my.pojo.UserInfo;

public interface UserInfoService {
    public UserInfo login(String userName, String password);
}
