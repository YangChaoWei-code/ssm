package com.ecpbm.service;

import com.ecpbm.pojo.Type;

import java.util.List;

public interface TypeService {
    // 获取所示商品类型
    public List<Type> getAll();

    // 添加商品类型
    public int addType(Type type);

    // 更新商品类型
    public void updateType(Type type);

}
