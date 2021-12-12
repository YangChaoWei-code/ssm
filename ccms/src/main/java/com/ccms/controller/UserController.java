package com.ccms.controller;

import com.ccms.pojo.Pager;
import com.ccms.pojo.SysModule;
import com.ccms.pojo.SysUser;
import com.ccms.service.UserService;
import com.ccms.tools.CommonValue;
import com.ccms.tools.JsonUtil;
import com.ccms.tools.MD5Util;
import com.google.gson.JsonObject;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    JsonUtil<SysUser> json = new JsonUtil<SysUser>();
    JsonObject jObject = null;

    // 登录
    @RequestMapping("/login")
    public String login(@RequestParam("name") String name, HttpServletRequest req, HttpServletResponse res,
                        @RequestParam("psw") String psw, HttpSession session, ModelAndView mv) throws IOException {
        SysUser user = userService.login(name, MD5Util.MD5(psw));
        if (user != null && user.getName() != null) {
            req.getSession().setAttribute(CommonValue.USERID, user.getUserCode());
            session.setAttribute(CommonValue.USERNAME, user.getName());
            session.setAttribute(CommonValue.UNITNAME, user.getUnitName());
            session.setAttribute(CommonValue.USERTYPE, user.getUserType());
            session.setAttribute(CommonValue.UNITINFOID, user.getUnitId());
            session.setAttribute(CommonValue.AREANUMBER, user.getAreaId());
            session.setAttribute(CommonValue.AERATYPE, user.getAreaType());
            session.setAttribute(CommonValue.AERANAME, user.getAreaName());
            res.sendRedirect(req.getContextPath() + "/views/index.jsp");
        } else {
            session.setAttribute(CommonValue.USERID, null);
            session.setAttribute(CommonValue.UNITINFOID, null);
            session.setAttribute(CommonValue.USERNAME, null);
            session.setAttribute(CommonValue.UNITNAME, null);
            session.setAttribute(CommonValue.USERTYPE, null);
            session.setAttribute(CommonValue.AREANUMBER, null);
            session.setAttribute(CommonValue.AERATYPE, null);
            session.setAttribute(CommonValue.AERANAME, null);
            res.sendRedirect(req.getContextPath() + "/login.jsp?rtnCode=500");
        }

        return null;
    }

    // 退出
    @RequestMapping(value = "/loginOut", method = { RequestMethod.GET, RequestMethod.POST })
    public String loginOut(HttpServletRequest req, HttpServletResponse resp) {
        req.getSession().setAttribute(CommonValue.USERID, null);
        req.getSession().setAttribute(CommonValue.UNITINFOID, null);
        req.getSession().setAttribute(CommonValue.USERNAME, null);
        req.getSession().setAttribute(CommonValue.USERTYPE, null);
        return "redirect:/login.jsp";
    }

    // 获取区域管理员
    @RequestMapping("/getAreaUser")
    @ResponseBody
    public Map<String, Object> getAreaUser(Integer page, Integer rows, HttpServletRequest req, HttpServletResponse rep,
                                           @ModelAttribute SysUser user) {
        // 初始化分页类对象
        Pager pager = new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        // 创建对象params，用于封装查询条件
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("user", user);
        // 获取满足条件的区域管理员总数
        int totalCount = userService.count(params);
        // 根据查询条件获取当前页的区域管理员列表
        List<SysUser> users = userService.findAreaUser(user, pager);
        // 创建对象result，用于保存返回结果
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("total", totalCount);
        result.put("rows", users);
        return result;
    }

    /**
     * 添加区域管理员
     *
     * @param user
     * @param req
     * @param res
     * @return String
     * @throws IOException
     */
    @RequestMapping(value = "/addAreaAdmin", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public String addAreaAdmin(SysUser user, HttpServletRequest req, HttpServletResponse res) throws IOException {
        jObject = new JsonObject();
        String operateId = req.getSession().getAttribute(CommonValue.USERID).toString();
        user.setOperatorId(operateId);
        user.setPsw(MD5Util.MD5(user.getPsw()));
        user.setUserCode("");
        user.setUserType("4");
        // 添加时检验该区域管理员是否已存在
        String exist = userService.isExistAreaAdminName(user);
        if (exist.equals("exit")) {
            jObject.addProperty("isExist", true);
        } else if (exist.equals("exitAdmin")) {
            jObject.addProperty("existAdmin", true);
        } else if (exist.equals("no")) {
            boolean result = userService.addUser(user);
            jObject.addProperty("success", result);
        }
        ServletOutputStream jos = res.getOutputStream();
        jos.write(jObject.toString().getBytes("utf-8"));
        return null;
    }

    /**
     * 修改区域管理员
     *
     * @param user
     * @param req
     * @param res
     * @return String
     */
    @RequestMapping(value = "/upAreaAdmin", method = { RequestMethod.GET, RequestMethod.POST })
    public String upAreaAdmin(SysUser user, HttpServletRequest req, HttpServletResponse res) {
        jObject = new JsonObject();
        boolean result = false;
        String operateId = req.getSession().getAttribute(CommonValue.USERID).toString();
        user.setOperatorId(operateId);
        // 修改时检验用户是否已存在
        String exist = userService.isExistAreaAdminName(user);
        if (exist.equals("exit")) {
            jObject.addProperty("isExist", true);
        } else if (exist.equals("exitAdmin")) {
            jObject.addProperty("existAdmin", true);
        } else if (exist.equals("no")) {
            result = userService.upAreaAdmin(user);
            jObject.addProperty("success", result);
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

    @RequestMapping(value = "/delUser", method = { RequestMethod.GET, RequestMethod.POST })
    public String delUser(HttpServletRequest req, HttpServletResponse res) {
        /* req.setCharacterEncoding("utf-8"); */
        String ids = req.getParameter("ids");
        boolean result = userService.delUser(ids, 2);
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

    // 修改密码
    @RequestMapping(value = "/upPsw", method = { RequestMethod.GET, RequestMethod.POST })
    public String upPsw(String userId, String psw_old, String psw_new, HttpServletRequest req, HttpServletResponse res)
            throws UnsupportedEncodingException {
        String result = userService.upPsw(userId, psw_old, psw_new);
        jObject = new JsonObject();
        if (result.equals("oldPswWrong".trim())) {
            jObject.addProperty("oldPswWrong", true);
        } else if (result.equals("success".trim())) {
            jObject.addProperty("success", true);
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

    // 查询user列表
    @RequestMapping(value = "/getUser", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getUser(Integer page, Integer rows, HttpServletRequest req, HttpServletResponse rep,
                                       @ModelAttribute SysUser user) {
        Pager pager = new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        String aredId = req.getSession().getAttribute("AREANUMBER").toString();
        user.setAreaId(aredId);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("user", user);
        int totalCount = userService.count1(params);
        List<SysUser> users = userService.findUser(user, pager);
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("total", totalCount);
        result.put("rows", users);
        return result;
    }

    // 添加用户
    @RequestMapping(value = "/addUser", method = { RequestMethod.GET, RequestMethod.POST })
    public String addUser(SysUser user, HttpServletRequest req, HttpServletResponse res) {
        // 从request中获取当前区域管理员的区域编号
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        // 给对象user设置所属区域编号属性
        user.setAreaId(areaId);
        jObject = new JsonObject();
        // 从request中获取当前区域管理员用户编号
        String operateId = req.getSession().getAttribute("USERID").toString();
        // 给对象user设置操作人属性
        user.setOperatorId(operateId);
        // 给对象user设置密码属性
        user.setPsw(MD5Util.MD5(user.getPsw()));
        // 判断该用户名是否存在
        String existName = userService.isExistName(user.getName(), "", areaId);
        // 判断该单位是否存在
        String existUnit = userService.isExistUnit(user.getUnitId(), "", areaId);
        if (existUnit.equals("exitUnit")) {
            jObject.addProperty("isExistUnit", true);
        } else if (existName.equals("exit")) {
            jObject.addProperty("isExist", true);
        } else if (existName.equals("no")) {
            // 调用业务方法添加用户
            boolean result = userService.addUser(user);
            jObject.addProperty("success", result);
        }
        try {
            ServletOutputStream jos = res.getOutputStream();
            jos.write(jObject.toString().getBytes("utf-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 修改用户
    @RequestMapping(value = "/upUser", method = { RequestMethod.GET, RequestMethod.POST })
    public String upUser(SysUser user, HttpServletRequest req, HttpServletResponse res) {
        String aredId = req.getSession().getAttribute("AREANUMBER").toString();
        jObject = new JsonObject();
        int result = 0;
        String operateId = req.getSession().getAttribute(CommonValue.USERID).toString();
        user.setOperatorId(operateId);
        String existName = userService.isExistName(user.getName(), user.getUserCode(), aredId);
        String existUnit = userService.isExistUnit(user.getUnitId(), user.getUserCode(), aredId);
        if (existUnit.equals("exitUnit")) {
            jObject.addProperty("isExistUnit", true);
        } else if (existName.equals("exit")) {
            jObject.addProperty("isExist", true);
        } else if (existName.equals("no")) {
            result = userService.upUser(user);
            jObject.addProperty("success", result);
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

    // 获取已绑定的rolecodes
    @RequestMapping(value = "/getCheckedRole", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getCheckedRole(String userCode, HttpServletRequest req, HttpServletResponse res) {
        Map<String, Object> result = new HashMap<String, Object>();
        List<String> list = userService.getCheckedRole(userCode);
        result.put("roleCodes", list);
        return result;
    }

    // 绑定新角色
    @RequestMapping(value = "/bindRole", method = { RequestMethod.GET, RequestMethod.POST })
    public String bindRole(SysUser user, HttpServletRequest req, HttpServletResponse res)
            throws UnsupportedEncodingException {
        String areaId = req.getSession().getAttribute(CommonValue.AREANUMBER).toString();
        int result = userService.bindRole(user.getUserCode(), user.getRoleCodes(), areaId);
        JSONObject jObject = new JSONObject();
        jObject.put("success", result);
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

    // 根据用户id获取module列表
    @RequestMapping(value = "/loadpermissions", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public List<SysModule> loadPermiss(String userId, HttpServletRequest req, HttpServletResponse res)
            throws Exception {
        List<SysModule> modules = userService.selectModuleByUserId(userId);
        if (modules == null) {
            modules = new ArrayList<SysModule>();
        }
        String json = new JsonUtil<SysModule>().objectsToJSON(modules);
        res.resetBuffer();
        res.setContentType("text/html;charset=utf-8");
        res.getOutputStream().write(json.getBytes("utf-8"));
        res.getOutputStream().flush();
        return null;
    }

    // 重置密码 默认为111
    @RequestMapping(value = "/resetPsw", method = { RequestMethod.GET, RequestMethod.POST })
    public String resetPsw(SysUser user, HttpServletRequest req, HttpServletResponse res)
            throws UnsupportedEncodingException {
        user.setPsw("111"); // 默认为111
        int result = userService.resetPsw(user);
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
}
