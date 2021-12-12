package com.ccms.dao;

import com.ccms.dao.provider.UserDynaSqlProvider;
import com.ccms.pojo.SysUser;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface UserDao {

    // 根据登录名和密码查询合法用户
    // @Select("select * from sys_user where name=#{name} and psw=#{psw} and
    // delState=1")
    @SelectProvider(type = UserDynaSqlProvider.class, method = "login")
    public SysUser selectByNameAndPwd(Map<String, Object> params);

    // 根据条件，分页动态查询区域管理员
    @SelectProvider(type = UserDynaSqlProvider.class, method = "selectWithParam")
    List<SysUser> selectByPage(Map<String, Object> params);

    // 根据条件查询区域管理员总数
    @SelectProvider(type = UserDynaSqlProvider.class, method = "count")
    Integer count(Map<String, Object> params);

    // 根据条件，分页动态查询用户
    @SelectProvider(type = UserDynaSqlProvider.class, method = "selectWithParam1")
    List<SysUser> selectByPage1(Map<String, Object> params);

    // 根据条件查询用户总数
    @SelectProvider(type = UserDynaSqlProvider.class, method = "count1")
    List<SysUser> count1(Map<String, Object> params);

    // 添加用户
    @Insert("insert into sys_user(userCode,name,psw,operatorId,delState,unitId,userType,areaId) "
            + "values(#{userCode},#{name},#{psw},#{operatorId},#{delState},#{unitId},#{userType},#{areaId})")
    public int insertUser(SysUser user);

    // 更新区域管理员
    @Update("update sys_user set name=#{name},areaId=#{areaId},operatorId=#{operatorId},operatorTime=now() "
            + "where userCode=#{userCode} and delState=1")
    public int upAreaAdmin(SysUser user);

    // 删除用户（即更新用户状态）
    @Update("update sys_user set delState=#{flag} where userCode in (${ids})")
    public int delUser(@Param("ids") String ids, @Param("flag") int flag);

    // 查询是否存在该区域管理员
    @Select("select count(userCode) from sys_user where name = #{name} and userCode <> #{userCode} and userType=#{userType} and delState =1")
    public int isExistAreaAdminName(SysUser user);

    // 检验该区域是否绑定管理员
    @Select("select count(userCode) from sys_user where areaId = #{areaId} and userCode <> #{userCode} and userType=#{userType} and delState =1")
    public int isExistAreaAdmin(SysUser user);

    // 判断旧密码是否正确
    @Select("select count(*) from sys_user where userCode =#{userCode} and psw=#{psw}")
    public int confirmOldPsw(@Param("userCode") String userCode, @Param("psw") String psw);

    // 修改密码
    @Update("update sys_user set psw=#{psw} where userCode =#{userCode}")
    public int resetPsw(@Param("userCode") String userCode, @Param("psw") String psw);

    // 检验是否存在该用户名
    @Select("select count(userCode) from sys_user where name = #{name} and userCode <> #{userCode} and areaId=#{areaId} and delState = 1")
    public int isExistName(@Param("name") String name, @Param("userCode") String userCode,
                           @Param("areaId") String areaId);

    // 检验该单位是否已经被绑定
    @Select("select count(userCode) from sys_user where unitId = #{unitId} and userCode <> #{userCode} and unitId <> '' and areaId =#{areaId} and unitId is not null and delState = 1")
    public int isExistUnit(@Param("unitId") String unitId, @Param("userCode") String userCode,
                           @Param("areaId") String areaId);

    // 修改用户
    @Update("update sys_user set name=#{name},unitId=#{unitId},userType=#{userType},operatorId=#{operatorId},operatorTime=now() where userCode=#{userCode} and delState=1")
    public int upUser(SysUser user);

    // 从sys_user_role表中根据userCode获取roleCode列表
    @Select("select roleCode from sys_user_role where userCode=#{userCode}")
    public List<String> getCheckedRole(@Param("userCode") String userCode);

    // 删除指定用户编号的角色
    @Delete("delete from sys_user_role where userCode=#{userCode}")
    public int delRoleByUserId(@Param("userCode") String userCode);

    // 给用户绑定新的角色
    @Insert("insert into sys_user_role(urId,userCode,roleCode,areaId) values (#{urId},#{userCode},#{roleCode},#{areaId})")
    public int bindRoleByUserId(@Param("urId") String urId, @Param("userCode") String userCode,
                                @Param("roleCode") String roleCode, @Param("areaId") String areaId);
}
