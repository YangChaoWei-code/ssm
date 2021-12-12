package com.ccms.controller;

import com.ccms.pojo.Pager;
import com.ccms.pojo.SysRole;
import com.ccms.pojo.SysUser;
import com.ccms.service.RoleService;
import com.ccms.tools.JsonUtil;
import com.ccms.tools.Tree;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/role", method = { RequestMethod.GET, RequestMethod.POST })
public class RoleController {
    @Autowired
    RoleService roleService;

    JsonUtil<SysUser> json = new JsonUtil<SysUser>();
    JsonObject jObject = null;

    // 查询所有role
    @RequestMapping(value = "/getAllRole", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getAllRole(Integer page, Integer rows, HttpServletRequest req, HttpServletResponse rep) {
        // 从request中获取当前区域管理员的区域编号
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        // 初始化分页类对象
        Pager pager = new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        // 创建对象params，用于封装查询条件
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("areaId", areaId);
        // 获取满足条件的角色总数
        int totalCount = roleService.count(params);
        // 根据查询条件获取当前页的角色列表
        List<SysRole> roles = roleService.getAllRole(areaId, pager);
        // 创建对象result，用于保存返回结果
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("total", totalCount);
        result.put("rows", roles);
        return result;
    }

    // 获取所有module
    @RequestMapping(value = "/getModule", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public List<Tree> getModuleListCheckedByRoleId(String roleCode, HttpServletRequest req, HttpServletResponse res) {
        // 从request中获取当前区域管理员的区域编号
        String aredId = req.getSession().getAttribute("AREANUMBER").toString();
        List<Tree> tree = roleService.getModuleListCheckedByRoleId(roleCode, aredId);
        return tree;
    }

    // 绑定module
    @RequestMapping(value = "/bindModule", method = { RequestMethod.GET, RequestMethod.POST })
    public String bindModuleByRoleId(String roleCode, String mids, HttpServletRequest req, HttpServletResponse res) {
        // 从request中获取当前区域管理员的区域编号
        String aredId = req.getSession().getAttribute("AREANUMBER").toString();
        int result = roleService.bindModuleByRoleId(roleCode, mids, aredId);
        jObject = new JsonObject();
        jObject.addProperty("success", result);
        try {
            ServletOutputStream jos = res.getOutputStream();
            jos.write(jObject.toString().getBytes("utf-8"));
            jos.flush();
            jos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 添加角色
    @RequestMapping(value = "/addRole", method = { RequestMethod.GET, RequestMethod.POST })
    public String addRole(String roleName, HttpServletRequest req, HttpServletResponse res) {
        jObject = new JsonObject();
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        String exist = roleService.isExistName(roleName, "", areaId); // 添加时检验id不存在该id,所以设为空
        if (exist.equals("no")) {
            int result = roleService.addRole(roleName, areaId);
            jObject.addProperty("success", result);
        } else {
            jObject.addProperty("isExist", true);
        }
        try {
            ServletOutputStream jos = res.getOutputStream();
            jos.write(jObject.toString().getBytes("utf-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 修改角色
    @RequestMapping(value = "/upRole", method = { RequestMethod.GET, RequestMethod.POST })
    public String upRole(SysRole role, HttpServletRequest req, HttpServletResponse res) {
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        jObject = new JsonObject();
        int result = 0;
        // 查询是否存在该名称
        String exist = roleService.isExistName(role.getRoleName(), role.getRoleCode(), areaId);
        if (exist.equals("no")) {
            result = roleService.upRole(role);
            jObject.addProperty("success", result);
        } else {
            jObject.addProperty("isExist", true);
        }
        try {
            ServletOutputStream jos = res.getOutputStream();
            jos.write(jObject.toString().getBytes("utf-8"));
            jos.flush();
            jos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 删除role
    @RequestMapping(value = "/delRole", method = { RequestMethod.GET, RequestMethod.POST })
    public String delRole(String roleCode, HttpServletRequest req, HttpServletResponse res) {
        int result = roleService.delRole(roleCode);
        jObject = new JsonObject();
        jObject.addProperty("success", result);
        try {
            ServletOutputStream jos = res.getOutputStream();
            jos.write(jObject.toString().getBytes("utf-8"));
            jos.flush();
            jos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 获取角色列表
    @RequestMapping(value = "/getRoleList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getRoleList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 从request中获取当前区域管理员的区域编号
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        // 根据当前区域管理员的区域编号，获取角色列表
        List<SysRole> list = roleService.getRoleList(areaId);
        int count = 0;
        if (list != null && list.size() > 0) {
            count = list.size();
        }
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("count", count);
        result.put("roleList", list);
        return result;
    }
}
