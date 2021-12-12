package com.ccms.service.impl;

import com.ccms.dao.ModuleDao;
import com.ccms.dao.UserDao;
import com.ccms.pojo.Pager;
import com.ccms.pojo.SysModule;
import com.ccms.pojo.SysUser;
import com.ccms.service.UserService;
import com.ccms.tools.MD5Util;
import com.ccms.tools.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;
    @Autowired
    ModuleDao moduleDao;

    @Override
    public SysUser login(String name, String psw) {
        Map<String, Object> params = new HashMap<>();
        params.put("name", name);
        params.put("psw", psw);
        return userDao.selectByNameAndPwd(params);
    }

    @Override
    public List<SysUser> findAreaUser(SysUser user, Pager pager) {
        // 创建对象params
        Map<String, Object> params = new HashMap<String, Object>();
        // 将封装有查询条件的user对象放入params
        params.put("user", user);
        // 根据条件计算区域管理员总数
        int recordCount = userDao.count(params);
        // 给pager对象设置rowCount属性值(记录总数)
        pager.setRowCount(recordCount);
        if (recordCount > 0) {
            // 将page对象放入params
            params.put("pager", pager);
        }
        // 分页获取区域管理员信息
        return userDao.selectByPage(params);
    }

    @Override
    public List<SysUser> findUser(SysUser user, Pager pager) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("user", user);
        int recordCount = userDao.count1(params).size();
        pager.setRowCount(recordCount);
        if (recordCount > 0) {
            params.put("pager", pager);
        }
        return userDao.selectByPage1(params);
    }

    @Override
    public Integer count(Map<String, Object> params) {
        return userDao.count(params);
    }

    @Override
    public boolean addUser(SysUser user) {
        Object[] params = null;
        String code = UUIDGenerator.getUUID();
        user.setUserCode(code);
        user.setDelState(1);
        int result = userDao.insertUser(user);
        return result > 0;
    }

    @Override
    public boolean upAreaAdmin(SysUser user) {
        int result = userDao.upAreaAdmin(user);
        return result > 0;
    }

    @Override
    public boolean delUser(String ids, int flag) {
        int result = userDao.delUser(ids, flag);
        return result > 0;
    }

    @Override
    public String isExistAreaAdminName(SysUser user) {
        String result;
        // 查询该管理员名是否存在
        int i = (Integer) userDao.isExistAreaAdminName(user);
        // 查询该区域是否绑定
        int j = (Integer) userDao.isExistAreaAdmin(user);
        if (j > 0) {
            result = "exitAdmin";
        } else if (i > 0) {
            result = "exit";
        } else {
            result = "no";
        }
        return result;
    }

    @Override
    public String upPsw(String userId, String psw_old, String psw_new) {
        psw_old = MD5Util.MD5(psw_old);
        int getOld = userDao.confirmOldPsw(userId, psw_old);
        if (getOld > 0) {
            String psw = MD5Util.MD5(psw_new);
            userDao.resetPsw(userId, psw);
            return "success";
        } else {
            return "oldPswWrong"; // 旧密码错误
        }
    }

    @Override
    public Integer count1(Map<String, Object> params) {
        return userDao.count1(params).size();
    }

    @Override
    public String isExistName(String name, String userCode, String areaId) {
        String result;
        int i = userDao.isExistName(name, userCode, areaId);
        if (i > 0) {
            result = "exit";
        } else {
            result = "no";
        }
        return result;
    }

    @Override
    public String isExistUnit(String unitId, String userCode, String areaId) {
        String result;
        int i = userDao.isExistUnit(unitId, userCode, areaId);
        if (i > 0) {
            result = "exitUnit";
        } else {
            result = "noUnit";
        }
        return result;
    }

    @Override
    public int upUser(SysUser user) {
        return userDao.upUser(user);
    }

    @Override
    public List<String> getCheckedRole(String userCode) {
        return userDao.getCheckedRole(userCode);
    }

    @Override
    public int bindRole(String userCode, String roleCodes, String areaId) {
        if (roleCodes.length() > 0) {
            roleCodes = roleCodes.substring(0, roleCodes.length() - 1);
        }
        String[] roleCode = roleCodes.split(",");
        int resulta = userDao.delRoleByUserId(userCode);
        if ((resulta > 0) && (roleCode == null || roleCodes.isEmpty())) {// 当给某个角色删除全部权限时
            return 1;
        }
        int result = 0;
        for (int i = 0; i < roleCode.length; i++) {
            result = userDao.bindRoleByUserId(UUIDGenerator.getUUID(), userCode, roleCode[i], areaId);
        }
        return result;
    }

    @Override
    public List<SysModule> selectModuleByUserId(String userId) {
        List<SysModule> result = new ArrayList<SysModule>();
        // 查询所有的模块
        List<SysModule> modules = moduleDao.getAllModule();
        if (modules == null) {
            modules = new ArrayList<SysModule>();
        }
        // 查询用户可以操作的模块编号集合
        List<String> mids = moduleDao.getmoduleCodes(userId);
        if (mids == null) {
            mids = new ArrayList<String>();
        }
        // 去除没有权限的叶子节点
        clear(modules, mids);
        // 建立模块层次结构
        for (int i = 0; i < modules.size(); i++) {
            SysModule m = modules.get(i);
            if (m.getParentCode() != null && m.getParentCode().equals("0")) {
                resetModules2(m, modules);
                result.add(m);
            }
        }
        return result;
    }

    // 根据mids去掉不存在的modules
    private void clear(List<SysModule> modules, List<String> mids) {
        for (int i = 0; i < modules.size(); i++) {
            SysModule m = modules.get(i);
            if (m.getModulePath() != null && !m.getModulePath().trim().equals("")) {
                boolean bl = false;
                for (int n = 0; n < mids.size(); n++) {
                    if (mids.get(n).toString().equals(m.getModuleCode())) {
                        bl = true;
                        break;
                    }
                }
                if (!bl) {
                    modules.remove(i);
                    i--;
                }
            }
        }
    }

    /**
     * 为m设置子节点
     *
     * @param m
     *            父节点
     * @param ms
     *            在ms中找到m的子节点 void
     */
    private void resetModules2(SysModule m, List<SysModule> ms) {
        for (int i = 0; i < ms.size(); i++) {
            SysModule c = ms.get(i);
            if (c.getParentCode() != null && c.getParentCode() != "") {
                if (c.getParentCode().equals(m.getModuleCode())) {
                    if (c.getModulePath() == null || c.getModulePath().trim().equals("")) {
                        resetModules2(c, ms);
                        if (c.getChildren().size() > 0) {
                            m.getChildren().add(c);
                        }
                    } else if (c.getModulePath() != null && !c.getModulePath().trim().equals("")) {
                        m.getChildren().add(c);
                    }
                }
            }
        }
    }

    @Override
    public int resetPsw(SysUser user) {
        String psw = MD5Util.MD5(user.getPsw());
        return userDao.resetPsw(user.getUserCode(), psw);
    }}
