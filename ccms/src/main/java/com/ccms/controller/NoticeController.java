package com.ccms.controller;

import com.ccms.pojo.Echarts;
import com.ccms.pojo.Notice;
import com.ccms.pojo.Pager;
import com.ccms.service.NoticeService;
import com.ccms.tools.CommonTool;
import com.ccms.tools.JsonUtil;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/notice", method = { RequestMethod.GET, RequestMethod.POST })
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    JsonUtil<Notice> json = new JsonUtil<Notice>();

    // 查询所有notice
    @RequestMapping(value = "/getAllNotice", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getAllNotice(@ModelAttribute Notice notice, Integer page, Integer rows,
                                            HttpServletRequest req, HttpServletResponse rep) {
        // 获取request中保存的当前登录用户的编号
        String uid = (String) req.getSession().getAttribute("USERID");
        // 将该用户编号设置到对象notice中
        notice.setUserId(uid);
        // 初始化分页类对象
        Pager pager = new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        // 创建对象params，用于封装查询条件
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("notice", notice);
        // 获取满足条件的消息总数
        int totalCount = noticeService.count(params);
        // 根据查询条件获取当前页的消息列表
        List<Notice> notices = noticeService.findNotice(notice, pager);
        // 创建对象result，用于保存返回结果
        Map<String, Object> result = new HashMap<String, Object>(2);
        result.put("total", totalCount);
        result.put("rows", notices);
        return result;
    }

    // 根据id获取详细信息
    @RequestMapping(value = "/getNoticeById", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getNoticeById(Notice notice, HttpServletRequest req, HttpServletResponse rep) {
        Map<String, Object> result = new HashMap<String, Object>(2);
        List<Notice> list = noticeService.getNoticeById(notice.getId());
        if (list.size() > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        result.put("rows", list);
        return result;
    }

    // 添加notice
    @RequestMapping(value = "/addNotice", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> addNotice(Integer type, String secondIds, String content, String title,
                                         HttpServletRequest req, HttpServletResponse resp) throws IOException {
        content = CommonTool.changeImageSrc(req, URLDecoder.decode(content, "utf-8"));
        Notice notice = new Notice();
        notice.setType(type);
        notice.setTitle(title);
        notice.setContent(content);
        String uid = (String) req.getSession().getAttribute("USERID");
        boolean flag = noticeService.addNotice(notice, secondIds, uid);
        Map<String, Object> result = new HashMap<String, Object>();
        if (flag) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        return result;
    }

    // 删除
    @RequestMapping(value = "/delNotice", method = { RequestMethod.GET, RequestMethod.POST })
    public String delNotice(String ids, HttpServletRequest req, HttpServletResponse res) {
        boolean result = noticeService.delNotice(ids);
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

    // 根据id获取信息详情
    @RequestMapping(value = "/getNoticeDetailNum", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> getNoticeDetailNum(String nid, HttpServletRequest req, HttpServletResponse res) {
        Map<String, Object> result = new HashMap<String, Object>(2);
        List<Echarts> elr = noticeService.getNoticeDetailNum(nid);
        List<Echarts> elv = noticeService.getNoticeVoteNum(nid);
        result.put("success", true);
        result.put("read", elr);
        result.put("vote", elv);
        return result;
    }
}
