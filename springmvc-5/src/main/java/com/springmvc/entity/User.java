package com.springmvc.entity;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Date;

public class User {
    @NotEmpty
    @Size(min=6, max=20)
    private String name;
    @Range(min = 18, max = 45)
    private int age;
    @Email
    @NotEmpty
    private String email;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    public User() {
    }

    public User(@NotEmpty @Size(min = 6, max = 20) String name, @Range(min = 18, max = 45) int age, @Email @NotEmpty String email) {
        this.name = name;
        this.age = age;
        this.email = email;
    }

    public User(String name, Date birthday) {
        this.name = name;
        this.birthday = birthday;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
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
}
