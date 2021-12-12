package com.ccms.controller;

import com.ccms.pojo.SysArea;
import com.ccms.service.SchoolService;
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
@RequestMapping(value = "/school", method = { RequestMethod.GET, RequestMethod.POST })
public class SchoolController {

    @Autowired
    private SchoolService schoolService;

    // 获取院校树
    @RequestMapping(value = "/getTreeList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getTreeList(HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        List<Tree> tree = schoolService.getSchoolTree();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("zNodes", tree);
        return result;
    }

    // 根据id获取单条数据
    @RequestMapping(value = "/getSingleData", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getSingleData(String id, HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        SysArea info = schoolService.getSingleDate(id);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("moduleData", info);
        return result;
    }

    // 修改
    @RequestMapping(value = "/upSchool", method = { RequestMethod.GET, RequestMethod.POST })
    public String upModule(SysArea area, HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        JSONObject jsonObject = new JSONObject();
        int result = schoolService.upSchool(area);
        if (result > 0) {
            jsonObject.put("success", "true");
        }
        resp.getOutputStream().write(jsonObject.toString().getBytes("utf-8"));
        resp.getOutputStream().flush();
        return null;
    }

    // 添加院校
    @RequestMapping(value = "/addSchool", method = { RequestMethod.GET, RequestMethod.POST })
    public String addModule(SysArea area, HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        JSONObject jsonObject = new JSONObject();
        // 添加操作
        int result = schoolService.addSchool(area);
        if (result > 0) {
            jsonObject.put("success", "true");
        }
        resp.getOutputStream().write(jsonObject.toString().getBytes("utf-8"));
        resp.getOutputStream().flush();
        return null;
    }

    // 删除
    @RequestMapping(value = "/delSchool", method = { RequestMethod.GET, RequestMethod.POST })
    public String deleteBatch(HttpServletRequest req, HttpServletResponse resp)
            throws UnsupportedEncodingException, IOException {
        JSONObject jsonObject = new JSONObject();
        req.setCharacterEncoding("utf-8");
        String ids = req.getParameter("ids");
        // 删除数据
        boolean result = schoolService.delSchool(ids) > 0;
        jsonObject.put("success", result);
        resp.getOutputStream().write(jsonObject.toString().getBytes("utf-8"));
        resp.getOutputStream().flush();
        return null;
    }
}
