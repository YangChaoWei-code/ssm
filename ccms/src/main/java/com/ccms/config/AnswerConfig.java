package com.ccms.config;

public class AnswerConfig {
	// 查询
	public static String getAllNotice = "select DISTINCT n.id,n.userId,n.title,n.content,n.operatetime,n.type,aw.flag,su.name as noticebelong,(case type when 1 then '消息' when 2 then '投票' when 3 then '保修' when 4 then '通知' end) as typeName "
			+ "from notice as n " + "left join sys_user as su on n.userId=su.userCode "
			+ "left join answer as aw on n.id = aw.nid "
			+ "where n.id in (select nid from answer where uid=?) and uid=? ";
	public static String UpFalg = "update answer set flag=1,vote=? where nid = ? and uid =?";
}
