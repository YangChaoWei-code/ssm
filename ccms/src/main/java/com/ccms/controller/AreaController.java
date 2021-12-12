package com.ccms.controller;

import com.ccms.pojo.SysArea;
import com.ccms.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/area", method = {RequestMethod.GET, RequestMethod.POST})
public class AreaController {

    @Autowired
    private AreaService areaService;

    /**
     * 获取省份列表
     */
    @RequestMapping(value = "/getShengAreaList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getShengAreaList(SysArea area, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        area.setType("1");
        List<SysArea> list = areaService.getAreaList(area);
        int count = 0;
        if (list != null && list.size() > 0) {
            count = list.size();
        }
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("count", count);
        result.put("CityList", list);
        return result;
    }

    /**
     * 获取市列表
     *
     * @param req
     * @param resp
     * @return
     * @throws IOException
     *             String
     */
    @RequestMapping(value = "/getShiAreaList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getShiAreaList(SysArea area, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        area.setType("2");
        List list = areaService.getAreaList(area);
        int count = 0;
        if (list != null && list.size() > 0) {
            count = list.size();
        }
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("count", count);
        result.put("CityList", list);
        return result;
    }

    /**
     * 获取院校(县)列表
     *
     * @param req
     * @param resp
     * @return
     * @throws IOException
     *             String
     */
    @RequestMapping(value = "/getXianAreaList", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getXianAreaList(SysArea area, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        area.setType("3");
        List list = areaService.getAreaList(area);
        int count = 0;
        if (list != null && list.size() > 0) {
            count = list.size();
        }
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("count", count);
        result.put("CityList", list);
        return result;
    }
}
