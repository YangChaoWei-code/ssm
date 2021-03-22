package com.mybatis.mapper;

import com.mybatis.pojo.Person;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface PersonMapper {
    @Select("select * from person where id = #{id}")
    @Results({@Result(column = "cid", property = "idcard",
            one = @One(select = "com.mybatis.mapper.IdcardMapper.findIdcardById"))})
    //根据id查询个人信息
    public Person findPersonById(int id);
}
