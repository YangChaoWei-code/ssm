package com.ecpbm.controller;

import com.ecpbm.pojo.Pager;
import com.ecpbm.pojo.UserInfo;
import com.ecpbm.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController {
    @Autowired
    UserInfoService userInfoService;

    @RequestMapping("/getValidUser")
    @ResponseBody
    public List<UserInfo> getValidUser() {
        List<UserInfo> uiList = userInfoService.getValidUser();
        UserInfo ui = new UserInfo();
        ui.setId(0);
        ui.setUserName("请选择...");
        uiList.add(0, ui);
        return uiList;
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> userList(Integer page, Integer rows, UserInfo userInfo) {
        // 创建分页类对象
        Pager pager = new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        // 创建对象params,封装查询条件
        Map<String, Object> params = new HashMap<>();
        params.put("userInfo", userInfo);
        // 根据查询条件，获取客户记录数
        int totalCount = userInfoService.count(params);
        // 根据查询条件，分页获取客户列表
        List<UserInfo> userInfos = userInfoService.findUserInfo(userInfo, pager);
        // 创建对象result，保存查询结果数据
        Map<String, Object> result = new HashMap<>(2);
        result.put("total", totalCount);
        result.put("rows", userInfos);
        return result;
    }

    // 更新客户状态
    @RequestMapping(value = "/setIsEnableUser", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String setIsEnableUser(@RequestParam(value = "uids") String uids, @RequestParam(value = "flag") String flag) {
        try {
            userInfoService.modifyStatus(uids.substring(0, uids.length() - 1), Integer.parseInt(flag));
            return "{\"success\": \"true\", \"message\": \"更改成功\"}";
        } catch (Exception e) {
            return "{\"success\": \"true\", \"message\": \"更改失败\"}";
        }
    }
}
