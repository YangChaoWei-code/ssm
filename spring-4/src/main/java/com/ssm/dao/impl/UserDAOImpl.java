package com.ssm.dao.impl;

import com.ssm.dao.UserDAO;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
    @Override
    public boolean login(String loginName, String loginPwd) {
        if (loginName.equals("admin") && loginPwd.equals("123456")) {
            return true;
        }
        return false;
    }
}
