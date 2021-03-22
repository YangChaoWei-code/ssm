package com.mybatis.pojo;

public class ProductInfo {
    private int id;
    private String code;
    private String name;
    // 关联属性
    private Type type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ProductInfo [id=" + id + ", code=" + code + ", name=" + name + "]";
    }
}
