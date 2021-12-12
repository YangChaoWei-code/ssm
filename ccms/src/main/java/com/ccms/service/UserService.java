package com.ccms.service;

import com.ccms.pojo.Pager;
import com.ccms.pojo.SysModule;
import com.ccms.pojo.SysUser;

import java.util.List;
import java.util.Map;

public interface UserService {
    // 登录
    public SysUser login(String name, String psw);

    // 分页获取区域管理员
    List<SysUser> findAreaUser(SysUser user, Pager pager);

    // 获取满足条件的区域管理员总数
    Integer count(Map<String, Object> params);

    // 添加用户
    public boolean addUser(SysUser user);

    // 修改区域管理员
    public boolean upAreaAdmin(SysUser user);

    // 删除用户
    public boolean delUser(String ids, int flag);

    // 查询是否存在该区域管理员
    public String isExistAreaAdminName(SysUser user);

    // 修改密码
    public String upPsw(String userId, String psw_old, String psw_new);

    // 分页显示用户
    List<SysUser> findUser(SysUser user, Pager pager);

    Integer count1(Map<String, Object> params);

    // 查询是否存在该用户名
    public String isExistName(String name, String userCode, String areaId);

    // 检测是否存在该单位
    public String isExistUnit(String unitId, String userCode, String areaId);

    // 修改用户
    public int upUser(SysUser user);

    // 根据Userid获取角色
    public List<String> getCheckedRole(String userCode);

    // 根据Userid绑定role
    public int bindRole(String userCode, String roleCodes, String areaId);

    // 根据用户id获取module列表
    public List<SysModule> selectModuleByUserId(String userId);

    // 重置密码
    public int resetPsw(SysUser user);

}
