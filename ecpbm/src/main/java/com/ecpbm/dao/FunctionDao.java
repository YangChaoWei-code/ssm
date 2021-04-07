package com.ecpbm.dao;

import com.ecpbm.pojo.Functions;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FunctionDao {
    // 根据管理员id,获取功能权限
    @Select("select * from functions where id in (select fid from powers where aid = #{aid} )")
    public List<Functions> selectByAdminId(Integer aid);
}
