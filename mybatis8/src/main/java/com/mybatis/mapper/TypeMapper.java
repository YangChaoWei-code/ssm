package com.mybatis.mapper;

import com.mybatis.pojo.Type;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface TypeMapper {
    // 根据商品类型编号查询商品类型信息
    @Select("select * from type where id = #{id}")
    @Results({@Result(id = true, column = "id", property = "id"),
              @Result(column = "name", property = "name"),
              @Result(column = "id", property = "pis",
                      many = @Many(select = "com.mybatis.mapper.ProductInfoMapper.findProductInfoByTid"))})
    Type findTypeById(int id);
}
