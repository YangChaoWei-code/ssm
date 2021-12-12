package com.ccms.config;

import com.ccms.tools.CommonValue;

public class SysUserConfig {
    // 获取用户信息
    public static String GetSysUser=
            "select "
                    +" su.*,"
                    +" (case when su.userType=1 then '院系账号'"
                    +"  when su.userType=3 then '平台管理员'"
                    +"  when su.userType=4 then '院校管理员'"
                    +"  else pui.name end)  as unitName,"
                    +"  sa_weiLeaf.type as areaType,"
                    +"  (case "
                    +"  when sa_weiLeaf.type=3 then CONCAT(sa_province.name,'.',sa_city.name,'.',sa_weiLeaf.name)"
                    +"  when sa_weiLeaf.type=2 then CONCAT(sa_city.name,'.',sa_weiLeaf.name)"
                    +"  when sa_weiLeaf.type=1 then CONCAT(sa_weiLeaf.name)"
                    +"  else '未知' end"
                    +"  ) as areaName"
                    +"   from sys_user as su "
                    +" left join pro_unitinfo as pui"
                    +"  on su.unitId=pui.id"
                    +"  left join sys_area as sa_weiLeaf"
                    +"  on su.areaId=sa_weiLeaf.areaNumber"
                    +"  left join sys_area as sa_city"
                    +"  on sa_weiLeaf.parentId=sa_city.areaNumber"
                    +"  left join sys_area as sa_province"
                    +"  on sa_city.parentId=sa_province.areaNumber"
                    +"  where 1=1 ";

    //根据用户id获取用户未读条数
    public static String getNoticeNum = "select count(id) from pro_protocolinfo "
            +"where receiveFlg='"+ CommonValue.ReceiveFlg_No+"' "
            +"and seeFlag='"+CommonValue.SeeFlg_Yes+"' "
            +"and unitInfoId= ?";
    //获取即将到期的协议条数
    public static String getExpireNum="select count(*) from pro_protocolinfo "
            +"where (effectFlag='01' or (effectFlag='02' and stopFlag='01')) "
            +"and effectiveEndDate <= CONCAT((SELECT ADDDATE(curdate(), (select remindDays from pro_setting limit 1))),' 23:59:59') "
            +"and effectiveEndDate >= DATE_FORMAT(curdate(), '%Y-%m-%d %H:%i:%s') "
            +"and unitInfoId=?";

    //获取即将到期的协议条数
    public static String getExpireNum2="select count(*) from pro_protocolinfo "
            +"where (effectFlag='01' or (effectFlag='02' and stopFlag='01')) "
            +"and effectiveEndDate <= CONCAT((SELECT ADDDATE(curdate(), (select remindDays from pro_setting where areaId=? limit 1))),' 23:59:59') "
            +"and effectiveEndDate >= DATE_FORMAT(curdate(), '%Y-%m-%d %H:%i:%s') "
            +"and unitInfoId=?";


    //获取即将到期的协议条数
    public static String getExpireNum3="select count(*) from pro_protocolinfo "
            +"where effectFlag="+CommonValue.EffectFlag_Yes
            +" and effectiveEndDate >= CONCAT((SELECT ADDDATE(curdate(), (select remindDays from pro_setting where areaId=? limit 1))),' 23:59:59') "
            +" and unitInfoId=?";


    //获取即将到期的协议条数（院方人员被提醒）
    public static String getExpireNum_shebao="select count(*) from pro_protocolinfo "
            +" where effectFlag="+CommonValue.EffectFlag_Yes
            +" and effectiveEndDate <= CONCAT((SELECT ADDDATE(curdate(), (select remindDays from pro_setting where areaId=? limit 1))),' 23:59:59') ";

    //当前日期加上到期提醒日期
    public static String curdateAddRemain="SELECT ADDDATE(curdate(), (select remindDays from pro_setting limit 1)) as afterdate";
    public static String curdateAddRemain2="SELECT SUBDATE(curdate(), (select remindDays from pro_setting where areaId=? limit 1)) as afterdate";


    public static String setReceivedByUnitId="update pro_protocolinfo set receiveFlg='"+CommonValue.ReceiveFlg_Yes+"' where "
            +"seeFlag='"+CommonValue.SeeFlg_Yes+"' "
            +"and unitInfoId=?";
    public static String getTabTitleByPath = "select moduleName from sys_module where 1=1 ";
    /*用户表*/
    //显示用户信息
    public static String getAllUser=
            "select "
                    +" su.*,GROUP_CONCAT(sr.roleName) as roleNames,"
                    +" (case when su.userType="+CommonValue.UserType_Shebao+" then '院方帐号' else pui.name end)  as unitName,ad.name as operator"
                    +" from sys_user as su "
                    +" left join sys_user_role as sur on su.userCode = sur.userCode "
                    +" left join sys_role as sr on sur.roleCode = sr.roleCode "
                    +" left join pro_unitinfo as pui"
                    +" on su.unitId=pui.id"
                    +" left join sys_user as ad"
                    +" on ad.userCode = su.operatorId"
                    +" where 1=1 and su.delState='"+CommonValue.DelState_No+"'";
    //添加用户
	/*public static String addUser = "insert into sys_user(userCode,name,psw,operatorId,delState,unitId,userType,areaId) "
		+"values(#{userCode},#{name},#{psw},#{operatorId},#{delState},#{unitId},#{userType},#{areaId})";*/
    //检验是否存在该用户名
    public static String isExistName="select count(userCode) from sys_user where name = ? and userCode <> ? and areaId=? and delState = "+CommonValue.DelState_No;
    //检验该机构是否已经被绑定
    public static String IsExistUnit="select count(userCode) from sys_user where unitId = ? and userCode <> ? and unitId <> '' and areaId =? and unitId is not null and delState = "+CommonValue.DelState_No;
    //删除用户
    public static String delUser = "update sys_user set delState ='"+CommonValue.DelState_Yes+"' where userCode in ({0})";
    //配置角色
    public static String delRoleByUserId = "delete from sys_user_role where userCode=? ";
    public static String bindRoleByUserId = "insert into sys_user_role(urId,userCode,roleCode,areaId) values (?,?,?,?)";
    public static String upUser="update sys_user set name=?,unitId=?,userType=?,operatorId=?,operatorTime=now() where userCode=? and delState="+CommonValue.DelState_No;
    //修改密码
    public static String resetPsw ="update sys_user set psw=? where userCode =?";
    //判断旧密码是否正确
    public static String confirmOldPsw ="select count(*) from sys_user where userCode =? and psw=?";
    public static String getCheckedRole ="select roleCode from sys_user_role where userCode=?";
    //显示所有区域管理员
    public static String getAllAreaAdmin="select  su.*,ad.name as operator, "
            +"(case when leaf.type=1 then leaf.areaNumber when leaf.type=3 then province.areaNumber when leaf.type=2 then city.areaNumber end)as province,"
            +"(case when leaf.type=2 then leaf.areaNumber when leaf.type=3 then city.areaNumber end) as city,"
            +"(case when leaf.type=3 then leaf.areaNumber end) as county,"
            +"(case when leaf.type=1 then concat(leaf.name) "
            +"when leaf.type=2 then concat(city.name,'.',leaf.name) "
            +"when leaf.type=3 then concat(province.name,'.',city.name,'.',leaf.name) else '未知' end) as areaName "
            +"from sys_user as su "
            +"left join sys_area as leaf on su.areaId = leaf.areaNumber "
            +"left join sys_area as city on leaf.parentId = city.areaNumber "
            +"left join sys_area as province on province.areaNumber = city.parentId "
            +"left join sys_user as ad "
            +"on ad.userCode = su.operatorId "
            +"where 1=1 and su.delState='"+CommonValue.DelState_No+"'";
    //检验是否存在该区域管理员名
    public static String isExistAreaAdminName="select count(userCode) from sys_user where name = ? and userCode <> ? and userType=? and delState = "+CommonValue.DelState_No;
    //检验该区域是否绑定管理员
    public static String isExistAreaAdmin="select count(userCode) from sys_user where areaId = ? and userCode <> ? and userType=? and delState = "+CommonValue.DelState_No;
    public static String upAreaAdmin="update sys_user set name=?,areaId=?,operatorId=?,operatorTime=now() where userCode=? and delState="+CommonValue.DelState_No;

}
