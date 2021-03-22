package com.mybatis.mapper;

import com.mybatis.pojo.Functions;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FunctionMapper {
    // 根据管理员id获取其功能权限列表
    @Select("select * from functions where id in (select fid from powers where aid = #{id})")
    List<Functions> findFunctionsByAid(int aid);
}
