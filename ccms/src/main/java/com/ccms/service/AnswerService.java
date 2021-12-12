package com.ccms.service;

import com.ccms.pojo.Notice;

import java.util.List;

public interface AnswerService {
    // 根据单位编号查询所有消息
    public List<Notice> getAllNotice(String unitId);

    // 修改状态位
    public int upFlag(String vote, String nid, String uid);
}
