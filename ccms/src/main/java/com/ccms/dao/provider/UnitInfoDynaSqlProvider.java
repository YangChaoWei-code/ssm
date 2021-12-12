package com.ccms.dao.provider;

import java.util.Map;

public class UnitInfoDynaSqlProvider {
    public String selectWithParam(Map<String, Object> params) {
        String sql = "select u.*,pt.name as unitType,pg.name as unitGrade from pro_unitinfo u "
                + "left join pro_paraminfo pt on u.unitTypeId = pt.id "
                + "left join pro_paraminfo pg on u.unitGradeId = pg.id " + "where u.delState='1' and 1=1";
        if (params.get("nameOrCode") != null) {
            String nameOrCode = (String) params.get("nameOrCode");
            sql += " and (u.name like '%" + nameOrCode + "%' or u.outside_code like '%" + nameOrCode + "%' )";
        }
        if (params.get("unitTypeId") != null && !params.get("unitTypeId").equals("")) {
            String unitTypeId = (String) params.get("unitTypeId");
            sql += " and unitTypeId='" + unitTypeId + "'";
        }
        if (params.get("unitGradeId") != null) {
            String unitGradeId = (String) params.get("unitGradeId");
            sql += " and unitGradeId='" + unitGradeId + "'";
        }
        if (params.get("areaId") != null) {
            String areaId = (String) params.get("areaId");
            sql += " and u.areaId='" + areaId + "'";
        }
        sql += " order by outside_code desc";
        if (params.get("pager") != null) {
            sql += " limit #{pager.firstLimitParam} , #{pager.perPageRows}  ";
        }
        return sql;
    }

    // 动态查询总记录数
    public String count(Map<String, Object> params) {
        String sql = "select u.*,pt.name as unitType,pg.name as unitGrade from pro_unitinfo u "
                + "left join pro_paraminfo pt on u.unitTypeId = pt.id "
                + "left join pro_paraminfo pg on u.unitGradeId = pg.id " + "where u.delState='1' and 1=1";
        if (params.get("nameOrCode") != null) {
            String nameOrCode = (String) params.get("nameOrCode");
            sql += " and (u.name like '%" + nameOrCode + "%' or u.outside_code like '%" + nameOrCode + "%' )";
        }
        if (params.get("unitTypeId") != null) {
            String unitTypeId = (String) params.get("unitTypeId");
            sql += " and unitTypeId='" + unitTypeId + "'";
        }
        if (params.get("unitGradeId") != null) {
            String unitGradeId = (String) params.get("unitGradeId");
            sql += " and unitGradeId='" + unitGradeId + "'";
        }
        if (params.get("areaId") != null) {
            String areaId = (String) params.get("areaId");
            sql += " and u.areaId='" + areaId + "'";
        }
        sql += " order by outside_code desc";
        return sql;
    }

    public String getInfo(Map<String, Object> params) {
        String areaId = (String) params.get("areaId");
        String nameOrCode = (String) params.get("nameOrCode");
        String unitTypeId = (String) params.get("unitTypeId");
        String unitGradeId = (String) params.get("unitGradeId");
        String sql = "select * from pro_unitinfo where delState=1";
        sql += " and areaId='" + areaId + "'";

        if (nameOrCode != null && !nameOrCode.isEmpty()) {
            sql += " and (name like '%" + nameOrCode + "%' or outside_code like '%" + nameOrCode + "%')";
        }
        if (unitTypeId != null && !unitTypeId.isEmpty()) {
            sql += " and unitTypeId='" + unitTypeId + "'";
        }
        if (unitGradeId != null && !unitGradeId.isEmpty()) {
            sql += " and unitGradeId='" + unitGradeId + "'";
        }
        sql += " order by outside_code desc";
        return sql;

    }
}
