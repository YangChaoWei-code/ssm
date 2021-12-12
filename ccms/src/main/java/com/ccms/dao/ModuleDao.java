package com.ccms.dao;

import com.ccms.pojo.SysModule;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ModuleDao {
    // 获取树形结构所有父节点
    @Select("select * from sys_module where parentCode is null order by sortNumber asc")
    public List<SysModule> getParentTree();

    // 根据功能模块编号,获取其所包含的功能模块
    @Select("select * from sys_module where parentCode = #{moduleCode} order by sortNumber asc")
    public List<SysModule> getTreeList(@Param("moduleCode") String moduleCode);

    // 根据功能模块编号获取数据
    @Select("select cm.*, (case when cm.parentCode is null then '无' " + " else  pm.moduleName end) as parentModuleName"
            + " from sys_module cm" + " left join sys_module pm" + " on cm.parentCode=pm.moduleCode"
            + " where cm.moduleCode= #{moduleCode}")
    public SysModule getSingleDataById(@Param("moduleCode") String moduleCode);

    // 根据id查询重复name
    @Select("select ifnull(count(*),0) from sys_module where moduleName=#{moduleName} and moduleCode <> #{moduleCode}")
    public int existSameModuleName(@Param("moduleName") String moduleName, @Param("moduleCode") String moduleCode);

    @Update("update sys_module set  moduleName = #{moduleName} , modulePath = #{modulePath} ,"
            + "parentCode = #{parentCode}, isLeaf = #{isLeaf}, sortNumber = #{sortNumber} where "
            + "moduleCode = #{moduleCode} ")
    public int updateModule(SysModule module);

    // 插入module
    @Insert("INSERT INTO sys_module(moduleCode, moduleName, modulePath, parentCode, isLeaf,sortNumber) VALUES "
            + "(#{moduleCode},#{moduleName},#{modulePath},#{parentCode},#{isLeaf},#{sortNumber})")
    public int insertModule(SysModule module);

    // 根据moduleId删除关联表
    @Delete("delete from sys_role_module where moduleCode in (${ids})")
    public int delRoleModule(@Param("ids") String ids);

    // 删除数据
    @Delete("delete from sys_module where moduleCode in (${ids})")
    public int deleteModule(@Param("ids") String ids);

    // 查询所有模块
    @Select("select * from sys_module order by sortNumber asc")
    public List<SysModule> getAllModule();

    // 查询用户可以操作的模块编号集合
    @Select("select distinct moduleCode from sys_role_module where roleCode "
            + "in (select roleCode from sys_user_role where userCode=#{userCode})")
    List<String> getmoduleCodes(@Param("userCode") String userCode);
}
