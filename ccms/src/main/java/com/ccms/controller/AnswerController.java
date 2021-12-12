package com.ccms.controller;

import com.ccms.pojo.Notice;
import com.ccms.service.AnswerService;
import com.ccms.tools.JsonUtil;
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
@RequestMapping(value = "/answer", method = { RequestMethod.GET, RequestMethod.POST })
public class AnswerController {
    @Autowired
    private AnswerService answerService;

    JsonUtil<Notice> json = new JsonUtil<Notice>();

    // 查询所有notice
    @RequestMapping(value = "/getNotice", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getNotice(Notice notice, HttpServletRequest req, HttpServletResponse rep) {
        String uid = (String) req.getSession().getAttribute("USERID");
        String unitid = req.getSession().getAttribute("UNITINFOID").toString();
        Map<String, Object> result = new HashMap<String, Object>(2);
        List<Notice> list = answerService.getAllNotice(unitid);
        if (list.size() > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        result.put("rows", list);
        return result;
    }

    // 改变状态位
    @RequestMapping(value = "/changerFlag", method = { RequestMethod.GET, RequestMethod.POST })
    public String changerFlag(String vote, String nid, HttpServletRequest req, HttpServletResponse res) {
        String unitid = req.getSession().getAttribute("UNITINFOID").toString();
        int result = answerService.upFlag(vote, nid, unitid);
        JsonObject jObject = new JsonObject();
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
