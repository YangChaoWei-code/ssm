package com.ccms.dao;

import com.ccms.pojo.SysArea;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface SchoolDao {
    // 获取所有父节点
    @Select("select * from sys_area where parentId is null or parentId = '' order by sortNum asc")
    public List<SysArea> getParentArea();

    // 获取所有子节点
    @Select("select * from sys_area where parentId=#{areaNumber} order by sortNum asc")
    public List<SysArea> getChildArea(@Param("areaNumber") String areaNumber);

    // 获取单条数据
    @Select("select sac.*,(case when sac.parentId is null then '院校配置' else sap.name end) as parentName "
            + "from sys_area as sac left join sys_area as sap on sac.parentId = sap.areaNumber "
            + "where sac.areaNumber = #{areaNumber} order by sortNum asc")
    public SysArea getSingleData(@Param("areaNumber") String areaNumber);

    // 更新
    @Update("update sys_area set name = #{name},type= #{type},sortNum=#{sortNum},isLeaf=#{isLeaf} where areaNumber=#{areaNumber}")
    public int updateSchool(SysArea area);

    // 添加
    @Insert("INSERT INTO sys_area (areaNumber, name, type, parentId, isLeaf, sortNum, delState) VALUES "
            + "(#{areaNumber}, #{name}, #{type}, #{parentId}, #{isLeaf}, #{sortNum}, 1)")
    public int insertSchool(SysArea area);

    // 删除
    @Delete("delete from sys_area where areaNumber in (${ids})")
    public int deleteSchool(@Param("ids") String ids);
}
