package com.ssm.service.impl;

import com.ssm.dao.UserDAO;
import com.ssm.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public boolean login(String loginName, String loginPwd) {
        return userDAO.login(loginName, loginPwd);
    }
}
