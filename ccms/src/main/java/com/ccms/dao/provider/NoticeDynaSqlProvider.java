package com.ccms.dao.provider;

import com.ccms.pojo.Notice;

import java.util.Map;

public class NoticeDynaSqlProvider {
    // 分页动态查询通知
    public String selectWithParam(Map<String, Object> params) {
        String sql = "select * from notice where 1=1 ";
        if (params.get("notice") != null) {
            Notice notice = (Notice) params.get("notice");
            if (notice.getTitle() != null && !notice.getTitle().isEmpty()) {
                sql += " and title LIKE '%" + notice.getTitle() + "%' ";
            }
            sql += " and userId ='" + notice.getUserId() + "'";
            sql += " order by operatetime desc";
        }
        if (params.get("pager") != null) {
            sql += " limit #{pager.firstLimitParam} , #{pager.perPageRows}  ";
        }
        return sql;
    }

    // 动态查询通知总记录数
    public String count(Map<String, Object> params) {
        String sql = "select count(*) from notice where 1=1 ";
        if (params.get("notice") != null) {
            Notice notice = (Notice) params.get("notice");
            if (notice.getTitle() != null && !notice.getTitle().isEmpty()) {
                sql += " and title LIKE '%" + notice.getTitle() + "%' ";
            }
            sql += " and userId ='" + notice.getUserId() + "'";
            sql += " order by operatetime desc";
        }
        return sql;
    }
}
