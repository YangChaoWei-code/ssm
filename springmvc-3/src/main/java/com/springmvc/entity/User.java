package com.springmvc.entity;

import java.util.List;

public class User {
    private String name;
    private String sex;
    private int age;
    private boolean reader;
    private List<String> courses;
    private int deptId;

    public User() {
    }

    public User(String name, String sex, int age) {
        this.name = name;
        this.sex = sex;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isReader() {
        return reader;
    }

    public void setReader(boolean reader) {
        this.reader = reader;
    }

    public List<String> getCourses() {
        return courses;
    }

    public void setCourses(List<String> courses) {
        this.courses = courses;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }
}
