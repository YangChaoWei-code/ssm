package com.ccms.service.impl;

import com.ccms.dao.AnswerDao;
import com.ccms.pojo.Notice;
import com.ccms.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("answerService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    AnswerDao answerDao;

    @Override
    public List<Notice> getAllNotice(String uid) {
        return answerDao.getAllNotice(uid);
    }

    @Override
    public int upFlag(String vote, String nid, String uid) {
        if (vote == null || vote.trim().length() <= 0) {
            vote = "0";
        }
        return answerDao.upFalg(vote, nid, uid);
    }
}
