package com.mybatis.pojo;

public class Functions {
    private int id;
    private String name;

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

    public Functions(String name) {
        super();
        this.name = name;
    }

    public Functions() {
        super();
    }

    @Override
    public String toString() {
        return "Functions [id=" + id + ", name=" + name + "]";
    }
}
