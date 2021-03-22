package com.mybatis.pojo;

import java.util.List;

public class AdminInfo {
    private int id;
    private String name;
    // 关联的属性
    private List<Functions> fs;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Functions> getFs() {
        return fs;
    }

    public void setFs(List<Functions> fs) {
        this.fs = fs;
    }

    public AdminInfo(String name) {
        super();
        this.name = name;
    }

    public AdminInfo() {
        super();
    }

    @Override
    public String toString() {
        return "AdminInfo [id=" + id + ", name=" + name + ", fs=" + fs + "]";
    }
}
