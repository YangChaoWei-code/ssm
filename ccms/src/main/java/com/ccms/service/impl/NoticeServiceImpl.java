package com.ccms.service.impl;

import com.ccms.dao.NoticeDao;
import com.ccms.pojo.Echarts;
import com.ccms.pojo.Notice;
import com.ccms.pojo.Pager;
import com.ccms.service.NoticeService;
import com.ccms.tools.CommonTool;
import com.ccms.tools.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("noticeService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    NoticeDao noticeDao;

    @Override
    public List<Notice> findNotice(Notice notice, Pager pager) {
        // 创建对象params
        Map<String, Object> params = new HashMap<String, Object>();
        // 将封装有查询条件的notice对象放入params
        params.put("notice", notice);
        // 根据条件计算消息总数
        int recordCount = noticeDao.count(params);
        // 给pager对象设置rowCount属性值(记录总数)
        pager.setRowCount(recordCount);
        if (recordCount > 0) {
            // 将page对象放入params
            params.put("pager", pager);
        }
        // 分页获取消息
        return noticeDao.selectByPage(params);
    }

    @Override
    public Integer count(Map<String, Object> params) {
        return noticeDao.count(params);
    }

    @Override
    public List<Notice> getNoticeById(String id) {
        return noticeDao.getNoticeById(id);
    }

    @Override
    public boolean addNotice(Notice notice, String answerids, String uid) {
        // 添加notice
        String nid = UUIDGenerator.getUUID();
        notice.setId(nid);
        notice.setUserId(uid);
        notice.setOperatetime(CommonTool.getNowDateStr());
        int resultNotice = noticeDao.addNotice(notice);
        // 添加answer
        String[] ids = answerids.split(",");
        int count = 0;
        for (int i = 0; i < ids.length; i++) {
            count += noticeDao.addAnswer(UUIDGenerator.getUUID(), nid, ids[i]);
        }
        return (resultNotice > 0) && (count > 0);
    }

    @Override
    public boolean delNotice(String ids) {
        ids = "'" + ids + "'";
        int result1 = noticeDao.delAnswer(ids);
        int result2 = noticeDao.delNotice(ids);
        return (result1 > 0) && (result2 > 0);
    }

    @Override
    public List<Echarts> getNoticeDetailNum(String nid) {
        List<Echarts> els = noticeDao.getNoticeReadNum(nid);
        return els;
    }

    @Override
    public List<Echarts> getNoticeVoteNum(String nid) {
        List<Echarts> elv = noticeDao.getNoticeVoteNum(nid);
        return elv;
    }

}
