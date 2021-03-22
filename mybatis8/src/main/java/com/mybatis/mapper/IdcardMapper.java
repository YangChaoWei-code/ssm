package com.mybatis.mapper;

import com.mybatis.pojo.Idcard;
import org.apache.ibatis.annotations.Select;

public interface IdcardMapper {
    // 根据id查询身份证信息
    @Select("select * from idcard where id=#{id}")
    public Idcard findIdcardById(int id);
}
