package com.mybatis.mapper;

import com.mybatis.pojo.ProductInfo;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProductInfoMapper {
    // 根据类型编号查询所有商品
    @Select("select * from product_info where tid = #{tid}")
    List<ProductInfo> findProductInfoByTid(int tid);

    // 根据商品编号获取商品信息
    @Select("select * from product_info where id = #{id}")
    @Results({@Result(column = "tid", property = "type",
            one = @One(select = "com.mybatis.mapper.TypeMapper.findTypeById"))})
    ProductInfo findProductInfoByid(int id);
}
