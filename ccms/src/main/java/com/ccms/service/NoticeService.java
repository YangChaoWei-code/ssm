package com.ccms.service;

import com.ccms.pojo.Echarts;
import com.ccms.pojo.Notice;
import com.ccms.pojo.Pager;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    // 分页显示通知
    List<Notice> findNotice(Notice notice, Pager pager);

    // 根据条件查询通知总数
    Integer count(Map<String, Object> params);

    // 根据id获取notice信息
    public List<Notice> getNoticeById(String id);

    // 添加
    public boolean addNotice(Notice notice, String answerids, String uid);

    // 删除
    public boolean delNotice(String ids);

    // 获取已读未读消息数目
    public List<Echarts> getNoticeDetailNum(String nid);

    // 获取投票信息
    public List<Echarts> getNoticeVoteNum(String nid);
}
