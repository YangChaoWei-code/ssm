package com.mybatis.pojo;

import java.util.List;

public class Type {
    private int id;
    private String name;
    // 关联集合属性
    private List<ProductInfo> pis;

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

    public List<ProductInfo> getPis() {
        return pis;
    }

    public void setPis(List<ProductInfo> pis) {
        this.pis = pis;
    }

    @Override
    public String toString() {
        return "Type [id=" + id + ", name=" + name + ", pis=" + pis + "]";
    }
}
