package com.ccms.controller;

import com.ccms.pojo.Pager;
import com.ccms.pojo.ProParamInfo;
import com.ccms.pojo.ProUnitinfo;
import com.ccms.service.UnitInfoService;
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
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/unitinfo")
public class UnitInfoController {
    @Autowired
    UnitInfoService unitInfoService;

    // 获取机构
    @RequestMapping(value = "/getUnitList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getUnitList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();

        List<ProUnitinfo> list = unitInfoService.getUnitList(areaId);
        int count = 0;
        if (list != null && list.size() > 0) {
            count = list.size();
        }
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("count", count);
        result.put("value", list);
        return result;
    }

    // 机构(单位)列表分页显示
    @RequestMapping("/queryUnitInfoList_table")
    @ResponseBody
    public Map<String, Object> queryUnitInfoList_Table(Integer page, Integer rows, String nameOrCode, String unitTypeId,
                                                       String unitGradeId, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 从request中获取区域编号
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        // 初始化分页类对象
        Pager pager = new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        // 创建对象params，用于封装查询条件
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("nameOrCode", nameOrCode);
        params.put("unitTypeId", unitTypeId);
        params.put("unitGradeId", unitGradeId);
        params.put("areaId", areaId);
        // 获取满足条件的单位总数
        int totalCount = unitInfoService.count(params);
        // 根据查询条件获取当前页的机构(单位)列表
        List<ProUnitinfo> list = unitInfoService.queryUnitInfoList_Table(params, pager);
        // 创建对象result，用于保存返回结果
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("total", totalCount);
        result.put("rows", list);
        return result;
    }

    // 获取单位类别列表
    @RequestMapping(value = "/getUnitTypeList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getUnitTypeList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 从request中获取当前区域管理员的区域编号
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        // 根据区域编号获取所有单位类别
        List<ProParamInfo> list = unitInfoService.getUnitTypeList(areaId);
        int count = 0;
        if (list != null && list.size() > 0) {
            count = list.size();
        }
        // 创建对象result，保存返回结果
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("count", count);
        result.put("unitTypeList", list);
        return result;
    }

    // 添加
    @RequestMapping(value = "/addUnit", method = { RequestMethod.GET, RequestMethod.POST })
    public String addUnit(ProUnitinfo info, HttpServletRequest req, HttpServletResponse res) {
        // 从request中获取当前区域管理员的区域编号
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        // 将区域编号封装在ProUnitinfo类型对象info中
        info.setAreaId(areaId);
        JsonObject jObject = new JsonObject();
        // 查询是否存在外部编码
        String exist = unitInfoService.isExistOutCode(info);
        if (exist.equals("no")) {
            // 添加单位
            int result = unitInfoService.addUnit(info);
            jObject.addProperty("success", result);
        } else {
            jObject.addProperty("exist", exist);
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

    // 修改单位
    @RequestMapping(value = "/upUnit", method = { RequestMethod.GET, RequestMethod.POST })
    public String upUnit(ProUnitinfo info, HttpServletRequest req, HttpServletResponse res) {
        String areaId = req.getSession().getAttribute("AREANUMBER").toString();
        info.setAreaId(areaId);
        JsonObject jObject = new JsonObject();
        String exist = unitInfoService.isExistOutCode(info);
        if (exist.equals("no")) {
            int result = unitInfoService.upUnit(info);
            jObject.addProperty("success", result);
        } else {
            jObject.addProperty("exist", exist);
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

    // 删除
    @RequestMapping(value = "/delUnit", method = { RequestMethod.GET, RequestMethod.POST })
    public String delUnit(HttpServletRequest req, HttpServletResponse res) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");
        String ids = req.getParameter("ids");
        JsonObject jObject = new JsonObject();
        int result = unitInfoService.delUnit(ids);
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

    // 查询所有单位信息
    @RequestMapping(value = "/queryUnitInfoList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> queryUnitInfoList(String nameOrCode, String unitTypeId, String unitGradeId,
                                                 HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String areaId = (String) req.getSession().getAttribute("AREANUMBER");
        List<ProUnitinfo> list = unitInfoService.queryUnitInfoList(nameOrCode, unitTypeId, unitGradeId, areaId);
        int count = 0;
        if (list != null && list.size() > 0) {
            count = list.size();
        }

        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("count", count);
        result.put("unitInfoList", list);

        return result;
    }
}
