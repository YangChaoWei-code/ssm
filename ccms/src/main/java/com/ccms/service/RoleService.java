package com.ccms.service;

import com.ccms.pojo.Pager;
import com.ccms.pojo.SysRole;
import com.ccms.tools.Tree;

import java.util.List;
import java.util.Map;

public interface RoleService {
    // 分页查询所有角色
    public List<SysRole> getAllRole(String areaId, Pager pager);

    // 获取满足条件的角色总数
    Integer count(Map<String, Object> params);

    // 根据roleid获取
    public List<Tree> getModuleListCheckedByRoleId(String roleCode, String areaId);

    // 查询是否存在该角色名
    public String isExistName(String name,String id,String areaId);

    // 添加角色
    public int addRole(String rname,String areaId);

    // 修改角色
    public int upRole(SysRole role);

    // 删除角色
    public int delRole(String roleCode);

    // 根据roleid绑定module
    public int bindModuleByRoleId(String roleCode,String mids,String areaId);

    // 根据areaId获取角色列表
    public List<SysRole> getRoleList(String areaId);
}
