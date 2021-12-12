package com.ccms.dao.provider;

import com.ccms.pojo.SysArea;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class AreaDynaSqlProvider {
    public String selectWithParam(Map<String, Object> params) {
        SysArea area = (SysArea) params.get("area");
        String sql = new SQL() {
            {
                SELECT("*");
                FROM("sys_area");
                WHERE(" type = #{area.type} ");
                if (area.getType() == "1") {
                    WHERE("parentId is null");
                }
                if (area.getType() != "1") {
                    WHERE("parentId = #{area.parentId} ");
                }
            }
        }.toString();
        return sql;
    }
}
