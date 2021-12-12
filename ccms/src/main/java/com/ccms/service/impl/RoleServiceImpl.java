package com.ccms.service.impl;

import com.ccms.dao.RoleDao;
import com.ccms.pojo.Pager;
import com.ccms.pojo.SysRole;
import com.ccms.service.RoleService;
import com.ccms.tools.Tree;
import com.ccms.tools.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("roleService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleDao roleDAO;

    @Override
    public List<SysRole> getAllRole(String areaId, Pager pager) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("areaId", areaId);
        int recordCount = roleDAO.count(params);
        pager.setRowCount(recordCount);
        if (recordCount > 0) {
            params.put("pager", pager);
        }
        return roleDAO.selectByPage(params);
    }

    @Override
    public Integer count(Map<String, Object> params) {
        return roleDAO.count(params);
    }

    @Override
    public List<Tree> getModuleListCheckedByRoleId(String roleCode, String areaId) {
        // 获取所有功能菜单
        List<Tree> allModuleList = roleDAO.getAllModule();
        // 根据角色编号和当前区域管理员区域编号获取功能菜单
        List<Tree> roleModuleList = roleDAO.getModuleByRoleId(roleCode, areaId);
        if (allModuleList != null & roleModuleList != null) {
            for (Tree tree : allModuleList) {
                if (roleModuleList.contains(tree)) {
                    tree.setChecked(true);
                }
                tree.setOpen(true);
            }
        }
        return allModuleList;
    }

    @Override
    public int bindModuleByRoleId(String roleCode, String mids, String areaId) {
        if (mids.length() > 0) {
            mids = mids.substring(0, mids.length() - 1);
        }
        String[] midStrings = mids.split(",");
        int resulta = 0, resultd = 0;
        // 不存在时返回0,不能作为判断失败的标准
        resultd = roleDAO.deleteModuleByRoleCode(roleCode, areaId);
        if ((resultd > 0) && (mids == null || mids.isEmpty())) {// 当给某个角色删除全部权限时
            return 1;
        }
        for (int i = 0; i < midStrings.length; i++) {
            // 当更改为没有权限时mids为空,resulta也不能作为判断操作成功与失败的唯一标准
            resulta = roleDAO.insertModuleBuRoleCode(UUIDGenerator.getUUID(), roleCode, midStrings[i], areaId);
        }
        return resulta;
    }

    @Override
    public String isExistName(String name, String id, String areaId) {
        String result;
        int i = roleDAO.isExistName(name, id, areaId);
        if (i > 0) {
            result = "exit";
        } else {
            result = "no";
        }
        return result;
    }

    @Override
    public int addRole(String rname, String areaId) {
        return roleDAO.addRole(UUIDGenerator.getUUID(), rname, areaId);
    }

    @Override
    public int upRole(SysRole role) {
        return roleDAO.upRole(role.getRoleName(), role.getRoleCode());
    }

    @Override
    public int delRole(String roleCode) {
        return roleDAO.delRole(roleCode);
    }

    @Override
    public List<SysRole> getRoleList(String areaId) {
        return roleDAO.getRoleList(areaId);
    }
}
