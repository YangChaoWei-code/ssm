package com.ssm.dao.impl;

import com.ssm.dao.UserDAO;

public class UserDAOImpl implements UserDAO {
    @Override
    public boolean login(String loginName, String loginPwd) {
        if (loginName.equals("admin") && loginPwd.equals("123456")) {
            return true;
        }
        return false;
    }
}
