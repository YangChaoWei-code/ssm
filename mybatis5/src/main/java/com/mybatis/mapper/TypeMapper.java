package com.mybatis.mapper;

import com.mybatis.pojo.Type;

public interface TypeMapper {
    Type findTypeById(int id);

    Type findTypeById2(int id);

    void addType(Type type);

    int deleteTypeById(int id);
}
