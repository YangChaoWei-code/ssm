package com.springmvc.entity;

public class User {
    private String loginName;
    private String loginPwd;
    private Address address;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public User(String loginName, String loginPwd, Address address) {
        this.loginName = loginName;
        this.loginPwd = loginPwd;
        this.address = address;
    }

    public User(){}

    @Override
    public String toString() {
        return "User{" +
                "loginName='" + loginName + '\'' +
                ", loginPwd='" + loginPwd + '\'' +
                ", address=" + address +
                '}';
    }
}
