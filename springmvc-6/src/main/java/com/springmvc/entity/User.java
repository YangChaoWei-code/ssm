package com.springmvc.entity;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Date;

public class User {
    private String loginName;
    private String password;
    private int age;
    private String email;
    private String phone;
    public String getLoginName() {
        return loginName;
    }
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public User() {
        super();
        // TODO Auto-generated constructor stub
    }
    public User(String loginName, String password, int age, String email, String phone) {
        super();
        this.loginName = loginName;
        this.password = password;
        this.age = age;
        this.email = email;
        this.phone = phone;
    }

}
