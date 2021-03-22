package com.my.service.impl;

import com.my.dao.UserInfoDao;
import com.my.pojo.UserInfo;
import com.my.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userInfoService")
public class UserInfoServiveImpl implements UserInfoService {

    @Autowired
    private UserInfoDao userInfoDao;

    @Override
    public UserInfo login(String userName, String password) {
        return userInfoDao.findUserInfoByCond(userName, password);
    }
}
