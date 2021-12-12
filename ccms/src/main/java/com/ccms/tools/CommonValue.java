package com.ccms.tools; 

import java.io.File;


public class CommonValue {
	
//	//参数分隔符
//	public static final String PARAM_START_STR0="$\\{";
//	
//	public static final String PARAM_START_STR="\\$\\{";
//	
//	public static final String PARAM_START_STR2="${";
//	
//	public static final String PARAM_START_END="}";
//	
//	public static final String PARAM_START_END2="\\}";
	
	public static final String NOT_PARAM_STR="([\\'7b\\'a1\\'ea\\'a3\\'a4\\'a1\\'a4\\'a1\\'ae\\'a1\\'b0\\'a1\\'b4\\'a1\\'b6\\'a1\\'b8\\'a1\\'ba\\'a1\\'be\\'a1\\'b2\\'a1\\'bc\\'a8\\'94\\'a9\\'76\\'a9\\'78\\'a9\\'7a\\'a1\\'e7\\'a3\\'a8\\'a3\\'ae\\'a3\\'db\\'a3\\'fb\\'a1\\'ea\\'a3\\'a4}{\\*\\ud\\uc0{\\*\\lchars ";
	
	public static final String NOT_PARAM_STR2="([";
	
	//参数分隔符
	public static final String PARAM_START_STR0="$";
	
	public static final String PARAM_START_STR="\\$";
	
	public static final String PARAM_START_END="$";
	
	public static final String PARAM_FLAG="$";
	
	public static final String PARAM_Trans="\\";
	
	public static final String PARAM_Blank=" ";

	public static final String APPNAME="SchoolManager";
	public static String USERID = "USERID";
	
	//两定单位ID
	public static String UNITINFOID = "UNITINFOID";

	public static String USERNAME = "USERNAME";
	
	public static String USERTYPE = "USERTYPE";
	
	public static String UNITNAME = "UNITNAME";
	
	public static String AREANUMBER = "AREANUMBER";
	
	public static String AERATYPE = "AERATYPE";
	
	public static String AERANAME = "AERANAME";
	
	//参数类型 01：协议类型；02：机构类型；03：机构等级；
	public static String Param_ProtocolType = "01";
	public static String Param_JiGouType = "02";
	public static String Param_JiGouDengJi = "03";
	
//	public static String Param_Line_Style = "<FONT FACE=\"Times New Roman, serif\"><SPAN LANG=\"en-US\"><FONT SIZE=4>__________</FONT></SPAN></FONT>";

	
	//Rtf文件夹
	public static String RtfTempletFile=File.separator + "attached"
	+ File.separator + "RtfTempletFile";
	
	//处理后的Rtf文件夹
	public static String RtfHandleTempletFile=File.separator + "attached"
	+ File.separator + "RtfHandleTempletFile";
	
	//模版文件存储文件夹
	public static String TempletFilePath=File.separator + "attached"
	+ File.separator + "TempletFile";
	
	//模版文件word转换成Html文件
	public static String TempletTransHtmlPath=File.separator + "attached"
	+ File.separator + "TempletTransHtml";

	//协议1
	public static String ProtocolFile1=File.separator + "attached"
	+ File.separator + "ProtocolFile1";
	
	//协议1
	public static String ProtocolFile2=File.separator + "attached"
	+ File.separator + "ProtocolFile2";
	
//	//协议1（html）
//	public static String HtmlProtocolFile1=File.separator + "attached"
//	+ File.separator + "HtmlProtocolFile1";
//	
//	//协议2（html）
//	public static String HtmlProtocolFile2=File.separator + "attached"
//	+ File.separator + "HtmlProtocolFile2";
	
	//协议模版中文确认文件(word文件)
	public static String TempletValidateSavePath_Word=File.separator + "attached"
	+ File.separator + "templetValidateWord";
	
	
	//协议模版中文确认文件(HTML文件)
	public static String TempletValidateSavePath_Html=File.separator + "attached"
	+ File.separator + "templetValidateHtml";
	

	//错误的机构file
	public static String ExcelErrorUnitFile=File.separator + "download"
	+ File.separator + "UnitErrorExcel";
	
	//参数文件存放路径
	public static String ParamsFile=File.separator + "attached"
	+ File.separator + "ParamsFile";
	
	//根据协议模版、两定单位生成的协议参数文件
	public static String PF=File.separator + "download"
	+ File.separator + "PF";
	
	//根据协议模版、两定单位生成的协议参数文件
	public static String DownLoadPath=File.separator + "download";
	
	//协议信息列表导出路径download/ProtocolTable
	public static String ProtocolTable=File.separator + "download"
	+ File.separator + "ProtocolTable";
	
	
	//删除状态(1：未删除；2：删除；)
	public static int DelState_No = 1;
	public static int DelState_Yes = 2;
	
	
	//机构处理状态\r\n            （\r\n            01：已处理；\r\n            02：未处理；\r\n            03：逾期未确认；\r\n            ）
	public static String UnitHandleFlag_Yes = "01";
	public static String UnitHandleFlag_No = "02";
	public static String UnitHandleFlag_OutTime = "03";
	
	public static String UnitHandleFlag_afterDealFlg_1 = "afterDealFlg-1";
	public static String UnitHandleFlag_afterDealFlg_3 = "afterDealFlg-3";
	
	
	//生效标识\r\n            （\r\n            01：已生效；\r\n            02：未生效；\r\n            ）
	public static String EffectFlag_Yes = "01";
	public static String EffectFlag_No = "02";
	
	//同意或拒绝\r\n            （\r\n            01：同意；\r\n            02：拒绝；\r\n ）
	public static String AgreeOrRefuse_Yes = "01";
	public static String AgreeOrRefuse_No = "02";
	
	//协议停止标识\r\n            （\r\n            01：中止；\r\n            02：终止；\r\n            ）
	public static String StopFlag_Off = "01";
	public static String StopFlag_Stop = "02";
	
	//是否导出过协议(1：未导出；2：已导出；)
	public static int ExpFlag_Yes = 2;
	public static int ExpFlag_No = 1;
	
	//接收标识（0：未接收；1：已接收；）
	public static int ReceiveFlg_Yes = 1;
	public static int ReceiveFlg_No = 0;
	
	//协议可见标识（01：可见；02：不可见；）
	public static String SeeFlg_Yes = "01";
	public static String SeeFlg_No = "02";
	
	//中止协议状态（01：未开始；02：中止协议中；03：结束）
	public static String StopState_Wating = "01";
	public static String StopState_Ing = "02";
	public static String StopState_Ending = "03";
	
	//用户类型（1：社保人员；2：两定单位；3：平台管理人员————可分配不同地域帐号 4：各地域管理人员；）
	public static int UserType_Shebao = 1;
	public static int UserType_Unit = 2;
	public static int UserType_SystemAdmin = 3;
	public static int UserType_AreaAdmin = 4;
	
	//是否接收查看（0：未接收；1：已接收；）
	public static int Remind_ViewFlag_No = 0;
	public static int Remind_ViewFlag_Yes = 1;
	
	
	//协议中乙方参数固定值
	//s1-"乙方名称",s2-"乙方地址",s3-"乙方法人代表",s4-"乙方法人代表身份证号码",s5-"乙方签字日期"
	public static String[] SecondFixParam = new String[]{"s1","s2","s3","s4","s5"};  
	public static String SecondName = "s1";  //乙方名称
	public static String SecondAddress = "s2";  //乙方地址
	public static String SecondJurPerson = "s3";  //乙方法人代表
	public static String SecJurPerCD = "s4";  //乙方法人代表身份证号码
	public static String SecondSignDate = "s5";  //乙方签字日期
	
	public static String Mode_ProtocolPart = "Protocol_Part";
	public static String Mode_ProtocolComplet = "Protocol_Complet";
	
	
	public static String TempletChineseValidate = "参数中文验证1.1.1-a-a";

	public static String[] UnitExcelParam = new String[]{"单位名称","单位类别","单位等级","编码"};
	
	
	//逾期再处理标识（1：逾期再处理中，等待乙方处理；2：期限中，乙方处理结束；3：期限过后，乙方未做任何处理；）
	public static int AfterDealFlg_Wating = 1;
	public static int AfterDealFlg_OK = 2;
	public static int AfterDealFlg_NoDeal = 3;

	//图片空间素材名称
	public final static String  WordHongxian = "word_hongxian";  
	public final static String  WordLogo = "word_logo";  
	
	public static String UplodContentImgFilePath=File.separator + "upload"
	+ File.separator + "ImgContent"; // 附件路径
	
	public static String ImgRoomPath=File.separator + "upload"
	+ File.separator + "ImgRoom"; // 图片空间
}

