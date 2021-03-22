package com.mybatis.mapper;

import com.mybatis.pojo.AdminInfo;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface AdminInfoMapper {
    // 根据管理员id查询管理员信息
    @Select("select * from admin_info where id = #{id}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "id", property = "fs",
            many = @Many(select = "com.mybatis.mapper.FunctionMapper.findFunctionsByAid"))
    })
    public AdminInfo findAdminInfoById(int id);
}
