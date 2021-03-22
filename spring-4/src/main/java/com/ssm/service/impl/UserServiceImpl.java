package com.ssm.service.impl;

import com.ssm.dao.UserDAO;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public boolean login(String loginName, String loginPwd) {
        return userDAO.login(loginName, loginPwd);
    }
}
