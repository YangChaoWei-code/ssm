package com.mybatis.mapper;

import com.mybatis.pojo.Person;

public interface PersonMapper {
    Person findPersonById(int id);
}
