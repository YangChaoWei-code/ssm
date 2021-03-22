package com.mybatis.mapper;

import com.mybatis.pojo.UserInfo;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class UserInfoDynaSqlProvider {
    public String selectWithParam(Map<String, Object> param) {
        return new SQL(){
            {
                SELECT("*");
                FROM("user_info");
                if (param.get("id") != null) {
                    WHERE("id = #{id}");
                }
                if (param.get("userName") != null) {
                    WHERE("userName = #{userName}");
                }
                if (param.get("password") != null) {
                    WHERE("password = #{password}");
                }
            }
        }.toString();
    }

    public String insertUserInfo(UserInfo userInfo) {
        return new SQL(){
            {
                INSERT_INTO("user_info");
                if (userInfo.getUserName() != null) {
                    VALUES("userName", "#{userName}");
                }
                if (userInfo.getPassword() != null) {
                    VALUES("password", "#{password}");
                }
            }
        }.toString();
    }

    public String updateUserInfo(UserInfo userInfo) {
        return new SQL(){
            {
                UPDATE("user_info");
                if (userInfo.getUserName() != null) {
                    SET("userName = #{userName}");
                }
                if (userInfo.getPassword() != null) {
                    SET("password = #{password}");
                }
                WHERE("id = #{id}");
            }
        }.toString();
    }

    public String deleteUserInfo(Map<String, Object> param) {
        return new SQL(){
            {
                DELETE_FROM("user_info");
                if (param.get("id") != null) {
                    WHERE("id = #{id}");
                }
                if (param.get("userName") != null) {
                    WHERE("userName = #{userName}");
                }
                if (param.get("password") != null) {
                    WHERE("password = #{password}");
                }
            }
        }.toString();
    }
}
