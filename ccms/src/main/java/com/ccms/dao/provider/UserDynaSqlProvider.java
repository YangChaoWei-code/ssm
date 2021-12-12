package com.ccms.dao.provider;

import com.ccms.config.SysUserConfig;
import com.ccms.pojo.SysUser;
import com.ccms.tools.CommonValue;

import java.util.Map;

public class UserDynaSqlProvider {
    // 登录
    public String login(Map<String, Object> params) {
        String name = (String) params.get("name");
        String psw = (String) params.get("psw");
        String sql = "select " + " su.*," + " (case when su.userType=1 then '院系账号'"
                + "  when su.userType=3 then '平台管理员'" + "  when su.userType=4 then '院校管理员'"
                + "  else pui.name end)  as unitName," + "  sa_weiLeaf.type as areaType," + "  (case "
                + "  when sa_weiLeaf.type=3 then CONCAT(sa_province.name,'.',sa_city.name,'.',sa_weiLeaf.name)"
                + "  when sa_weiLeaf.type=2 then CONCAT(sa_city.name,'.',sa_weiLeaf.name)"
                + "  when sa_weiLeaf.type=1 then CONCAT(sa_weiLeaf.name)" + "  else '未知' end" + "  ) as areaName"
                + "   from sys_user as su " + " left join pro_unitinfo as pui" + "  on su.unitId=pui.id"
                + "  left join sys_area as sa_weiLeaf" + "  on su.areaId=sa_weiLeaf.areaNumber"
                + "  left join sys_area as sa_city" + "  on sa_weiLeaf.parentId=sa_city.areaNumber"
                + "  left join sys_area as sa_province" + "  on sa_city.parentId=sa_province.areaNumber"
                + "  where 1=1 ";
        sql += " and su.delState=1";
        sql += " and su.name='" + name + "' and su.psw='" + psw + "'";
        return sql;
    }

    // 分页动态查询区域管理员
    public String selectWithParam(Map<String, Object> params) {
        String sql = SysUserConfig.getAllAreaAdmin;
        if (params.get("user") != null) {
            SysUser user = (SysUser) params.get("user");

            if (user.getName() != null && !"".equals(user.getName())) {
                sql += " and su.name LIKE '%" + user.getName() + "%' ";
            }
            if (user.getAreaId() != null && !user.getAreaId().isEmpty()) {
                sql += " and su.areaId in (select areaNumber from sys_area as sa where sa.areaNumber= '"
                        + user.getAreaId() + "'";
                sql += " union all select areaNumber from sys_area as sa where sa.parentId='" + user.getAreaId() + "'";
                sql += " union all select areaNumber from sys_area as sa where sa.parentId in (select areaNumber from sys_area as sa where sa.parentId='"
                        + user.getAreaId() + "')" + ") ";
            }

            sql += " and su.userType=" + user.getUserType() + "";
            sql += " order by operatorTime desc";
        }

        if (params.get("pager") != null) {
            sql += " limit #{pager.firstLimitParam} , #{pager.perPageRows}  ";
        }
        return sql;
    }

    // 动态查询区域管理员总记录数
    public String count(Map<String, Object> params) {
        String sql = "select  count(*) from sys_user as su where su.delState=1";
        if (params.get("user") != null) {
            SysUser user = (SysUser) params.get("user");

            if (user.getName() != null && !"".equals(user.getName())) {
                sql += " and su.name LIKE '%" + user.getName() + "%' ";
            }
            if (user.getAreaId() != null && !user.getAreaId().isEmpty()) {
                sql += " and su.areaId in (select areaNumber from sys_area as sa where sa.areaNumber= '"
                        + user.getAreaId() + "'";
                sql += " union all select areaNumber from sys_area as sa where sa.parentId='" + user.getAreaId() + "'";
                sql += " union all select areaNumber from sys_area as sa where sa.parentId in (select areaNumber from sys_area as sa where sa.parentId='"
                        + user.getAreaId() + "')" + ") ";
            }
            sql += " and su.userType=" + user.getUserType() + "";
            sql += " order by operatorTime desc";
        }
        return sql;
    }

    // 分页动态查询用户
    public String selectWithParam1(Map<String, Object> params) {
        String sql = SysUserConfig.getAllUser;
        if (params.get("user") != null) {
            SysUser user = (SysUser) params.get("user");
            if (user.getName() != null && !user.getName().isEmpty()) {
                sql += " and su.name like '%" + user.getName() + "%'";
            }
            if (user.getUnitId() != null && !user.getUnitId().isEmpty()) {
                sql += " and su.unitId like '%" + user.getUnitId() + "%'";
            }
            if (user.getUserType() != null && !user.getUserType().isEmpty()) {
                sql += " and su.userType like '%" + user.getUserType() + "%'";
            }
            if (user.getAreaId() != null && !user.getAreaId().isEmpty()) {
                sql += " and su.areaId like '%" + user.getAreaId() + "%'";
            }
            sql += " and su.userType in ('" + CommonValue.UserType_Shebao + "','" + CommonValue.UserType_Unit + "')";
            sql += " group by su.userCode order by operatorTime desc";
        }

        if (params.get("pager") != null) {
            sql += " limit #{pager.firstLimitParam} , #{pager.perPageRows}  ";
        }
        return sql;
    }

    // 动态查询用户总记录数
    public String count1(Map<String, Object> params) {
        String sql = SysUserConfig.getAllUser;
        if (params.get("user") != null) {
            SysUser user = (SysUser) params.get("user");
            if (user.getName() != null && !user.getName().isEmpty()) {
                sql += " and su.name like '%" + user.getName() + "%'";
            }
            if (user.getUnitId() != null && !user.getUnitId().isEmpty()) {
                sql += " and su.unitId like '%" + user.getUnitId() + "%'";
            }
            if (user.getUserType() != null && !user.getUserType().isEmpty()) {
                sql += " and su.userType like '%" + user.getUserType() + "%'";
            }
            if (user.getAreaId() != null && !user.getAreaId().isEmpty()) {
                sql += " and su.areaId like '%" + user.getAreaId() + "%'";
            }
            sql += " and su.userType in ('" + CommonValue.UserType_Shebao + "','" + CommonValue.UserType_Unit + "')";
            sql += " group by su.userCode order by operatorTime desc";
        }
        return sql;
    }
}
