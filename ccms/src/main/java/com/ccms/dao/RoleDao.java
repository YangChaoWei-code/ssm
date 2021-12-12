package com.ccms.dao;

import com.ccms.dao.provider.RoleDynaSqlProvider;
import com.ccms.pojo.SysRole;
import com.ccms.tools.Tree;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface RoleDao {
    // 分页获取所有角色
    @SelectProvider(type = RoleDynaSqlProvider.class, method = "selectWithParam")
    List<SysRole> selectByPage(Map<String, Object> params);

    // 根据条件查询角色总数
    @SelectProvider(type = RoleDynaSqlProvider.class, method = "count")
    int count(Map<String, Object> params);

    // 所有module菜单
    @Select("select moduleCode as id, moduleName as name, parentCode as pId from sys_module")
    public List<Tree> getAllModule();

    // 根据角色获取module菜单
    @Select("select sm.moduleCode as id,moduleName as name,parentCode as pId "
            + "from sys_module sm left join sys_role_module srm on sm.moduleCode=srm.moduleCode "
            + "where srm.roleCode=#{roleCode} " + "and srm.areaId=#{areaId}")
    public List<Tree> getModuleByRoleId(@Param("roleCode") String roleCode, @Param("areaId") String areaId);

    // 删除所有roleid下的module
    @Delete("delete from sys_role_module where roleCode = #{roleCode} and areaId=#{areaId}")
    public int deleteModuleByRoleCode(@Param("roleCode") String roleCode, @Param("areaId") String areaId);

    // 查询是否存在该角色名
    @Select("select count(*) from sys_role where roleName=#{roleName} and roleCode <> #{roleCode} and areaId=#{areaId}")
    public int isExistName(@Param("roleName") String roleName, @Param("roleCode") String roleCode,
                           @Param("areaId") String areaId);

    // 添加角色
    @Insert("insert into sys_role(roleCode,roleName,areaId) values(#{roleCode},#{roleName},#{areaId})")
    public int addRole(@Param("roleCode") String roleCode, @Param("roleName") String roleName,
                       @Param("areaId") String areaId);

    // 修改
    @Update("update sys_role set roleName = #{roleName} where roleCode= #{roleCode} ")
    public int upRole(@Param("roleName") String roleName, @Param("roleCode") String roleCode);

    // 删除
    @Delete("delete from sys_role where roleCode = #{roleCode}")
    public int delRole(@Param("roleCode") String roleCode);

    // 根据roleid添加module
    @Insert("insert into sys_role_module(rmId,roleCode,moduleCode,areaId) values(#{rmId},#{roleCode},#{moduleCode},#{areaId})")
    public int insertModuleBuRoleCode(@Param("rmId") String rmId, @Param("roleCode") String roleCode,
                                      @Param("moduleCode") String moduleCode, @Param("areaId") String areaId);

    @Select("select * from sys_role where areaId=#{areaId}")
    public List<SysRole> getRoleList(@Param("areaId") String areaId);
}
