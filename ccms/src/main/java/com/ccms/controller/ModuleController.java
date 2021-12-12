package com.ccms.controller;

import com.ccms.pojo.SysModule;
import com.ccms.service.ModuleService;
import com.ccms.tools.Tree;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/module", method = { RequestMethod.GET, RequestMethod.POST })
public class ModuleController {
    @Autowired
    private ModuleService moduleService;

    // 获取module树
    @RequestMapping(value = "/getTreeList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getTreeList(HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        List<Tree> tree = moduleService.getProtocolTree();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("zNodes", tree);
        return result;
    }

    // 根据id获取单条数据
    @RequestMapping(value = "/getSingleData", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getSingleData(String id, HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        SysModule info = moduleService.getSingleDate(id);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("moduleData", info);
        return result;
    }

    // 修改
    @RequestMapping(value = "/upModule", method = { RequestMethod.GET, RequestMethod.POST })
    public String upModule(SysModule module, HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        JSONObject jsonObject = new JSONObject();
        // 检查是否存在重复名
        String isExist = moduleService.isExistName(module.getModuleName(), module.getModuleCode());
        if (isExist.equals("no")) {
            // 添加操作
            int result = moduleService.upModule(module);
            if (result > 0) {
                jsonObject.put("success", "true");
            }
        } else {
            jsonObject.put("exist", "existName");
        }
        resp.getOutputStream().write(jsonObject.toString().getBytes("utf-8"));
        resp.getOutputStream().flush();
        return null;
    }

    // 添加数据
    @RequestMapping(value = "/addModule", method = { RequestMethod.GET, RequestMethod.POST })
    public String addModule(SysModule module, HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {

        JSONObject jsonObject = new JSONObject();
        // 检查是否存在重复名
        String isExist = moduleService.isExistName(module.getModuleName(), "");
        if (isExist.equals("no")) {
            // 添加操作
            int result = moduleService.addModule(module);
            if (result > 0) {
                jsonObject.put("success", "true");
            }
        } else {
            jsonObject.put("exist", "existName");
        }
        resp.getOutputStream().write(jsonObject.toString().getBytes("utf-8"));
        resp.getOutputStream().flush();
        return null;
    }

    // 删除
    @RequestMapping(value = "/delModule", method = { RequestMethod.GET, RequestMethod.POST })
    public String delModule(HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        JSONObject jsonObject = new JSONObject();
        req.setCharacterEncoding("utf-8");
        String ids = req.getParameter("ids");
        // 删除数据
        int resultModuleRole = moduleService.delModuleRole(ids);
        int result = moduleService.delModule(ids);
        jsonObject.put("success", result);
        resp.getOutputStream().write(jsonObject.toString().getBytes("utf-8"));
        resp.getOutputStream().flush();
        return null;
    }
}
