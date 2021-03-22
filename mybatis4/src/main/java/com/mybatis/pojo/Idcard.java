package com.mybatis.pojo;

public class Idcard {
    private int id;
    private String cno;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    @Override
    public String toString() {
        return "Idcard [id=" + id + ", cno=" + cno + "]";
    }

}
