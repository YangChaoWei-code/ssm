package com.ccms.dao.provider;

import java.util.Map;

public class RoleDynaSqlProvider {
    // 分页动态查询角色
    public String selectWithParam(Map<String, Object> params) {
        String areaId = (String) params.get("areaId");
        String sql = "select roleCode,roleName from sys_role where areaId='" + areaId + "'";
        if (params.get("pager") != null) {
            sql += " limit #{pager.firstLimitParam} , #{pager.perPageRows}  ";
        }
        return sql;
    }

    // 动态查询角色总记录数
    public String count(Map<String, Object> params) {
        String areaId = (String) params.get("areaId");
        String sql = "select count(*) from sys_role where areaId='" + areaId + "'";
        return sql;
    }
}
