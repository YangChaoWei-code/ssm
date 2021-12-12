package com.ccms.config;

public class SysAreaConfig {
	/**
	 * 获取所有父节点
	 */
	public static String GetParentArea = "select * from sys_area where parentId is null or parentId = '' order by sortNum asc";

	/**
	 * GetChildArea:获取所有子节点
	 */
	public static String GetChildArea = "select * from sys_area where parentId=? order by sortNum asc ";
	/**
	 * getAllArea:获取所有数据
	 */
	public static String getAllArea = "select * from sys_area where 1=1  ";

	/**
	 * InsertSchool:插入数据
	 */
	public static String InsertSchool = "INSERT INTO `sys_area` (`areaNumber`, `name`, `type`, `parentId`, `isLeaf`, `sortNum`, `delState`) VALUES (?, ?, ?, ?, ?, ?, 1)";
	/** 删除 */
	public static String DeleteSchool = "delete from sys_area where " + " areaNumber in ({0})";
	/** 修改 */
	public static String UpdateSchool = "update sys_area set name = ?,type= ?,sortNum=?,isLeaf=? where areaNumber=?";
	public static String ChangeJoin = "update sys_area set parentId=? where areaNumber=?";
	/**
	 * GetSingleData:获取单条数据
	 */
	public static String GetSingleData = "select sac.*,(case when sac.parentId is null then '院校配置' else sap.name end) as parentName "
			+ "from sys_area as sac " + "left join sys_area as sap " + "on sac.parentId = sap.areaNumber "
			+ "where sac.areaNumber = ? order by sortNum asc";
}
