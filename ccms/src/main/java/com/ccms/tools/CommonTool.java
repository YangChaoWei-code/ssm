package com.ccms.tools;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.util.FileUtil;
import org.springframework.web.multipart.MultipartFile;

import com.ccms.DocUtil.HTMLSpirit;

public class CommonTool {
	public static void main(String[] args) {
		System.out.println(getNowDateStr());
	}

	/**
	 *      * 从HTML源码中提取图片路径，最后以一个 String 类型的 List 返回，如果不包含任何图片，则返回一个 size=0 的List
	 *      * 需要注意的是，此方法只会提取以下格式的图片：.jpg|.bmp|.eps|.gif|.mif|.miff|.
	 * png|.tif|.tiff|.svg|.wmf|.jpe|.jpeg|.dib|.ico|.tga|.cut|.pic      * @param
	 * htmlCode HTML源码      * @return <img>标签 src 属性指向的图片地址的List集合      * @author
	 * Carl He      
	 */
	public static String changeImageSrc(HttpServletRequest request, String htmlCode) {

		String UPLOAD_PATH_IMG_UEDITOR_fire = File.separator + CommonValue.APPNAME
				+ CommonValue.UplodContentImgFilePath;
		String UPLOAD_PATH_IMGROOM_UEDITOR_fire = File.separator + CommonValue.APPNAME + CommonValue.ImgRoomPath;
		if (htmlCode != null) {
			Pattern p = Pattern.compile(
					"<img\\b[^>]*\\bsrc\\b\\s*=\\s*('|\")?([^'\"\n\r\f>]+(\\.jpg|\\.JPG|\\.bmp|\\.eps|\\.gif|\\.mif|\\.miff|\\.png|\\.tif|\\.tiff|\\.svg|\\.wmf|\\.jpe|\\.jpeg|\\.dib|\\.ico|\\.tga|\\.cut|\\.pic)\\b)[^>]*>",
					Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(htmlCode);
			String quote = null;
			String src = null;
			String filename = null;
			String newsrc = null;
			String realpath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
			while (m.find()) {
				quote = m.group(1);
				src = (quote == null || quote.trim().length() == 0) ? m.group(2).split("\\s+")[0] : m.group(2);
				if (!src.contains("http")) {
					filename = src.substring(src.lastIndexOf("/") + 1);

					if (filename.contains(CommonValue.WordHongxian) || filename.contains(CommonValue.WordLogo)) {
						newsrc = realpath + UPLOAD_PATH_IMGROOM_UEDITOR_fire + File.separator + filename;
					} else {
						newsrc = realpath + UPLOAD_PATH_IMG_UEDITOR_fire + File.separator + filename;
					}
					htmlCode = htmlCode.replace(src, newsrc);
				}
			}
			return htmlCode;
		} else {
			return null;
		}

	}

	/**
	 * 获取现在时间(String类型)
	 * 
	 * @return 返回时间类型 yyyyMMddHHmmssSSS
	 */
	public static String getNowDateStr3() {
		String dateString = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());

		return dateString;
	}

	/**
	 *  拼接附件路径      
	 */
	public static String changeAttachSrc(HttpServletRequest request, String webPath) {

		String realpath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ File.separator + CommonValue.APPNAME;
		String newsrc = realpath + webPath;
		return newsrc;
	}

	// yyyy-MM-dd HH:mm:ss
	public static Date convertStringToDate(String time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date timeConvert = null;
		try {

			timeConvert = sdf.parse(time);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return timeConvert;
	}

	public static List<String> removeDuplicate(List<String> list) {
		HashSet<String> hashSet = new HashSet<String>(list);
		List<String> resultList = new ArrayList<String>();
		resultList.addAll(hashSet);
		return resultList;
	}

	/**
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static Date getNowDate() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		ParsePosition pos = new ParsePosition(8);
		Date currentTime_2 = formatter.parse(dateString, pos);
		return currentTime_2;
	}

	/**
	 * ��ȡ����ʱ��(String����)
	 * 
	 * @return ����ʱ������ yyyy-MM-dd HH:mm:ss
	 */
	public static String getNowDateStr() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		return dateString;
	}

	/**
	 * ��ȡ����ʱ��(String����)
	 * 
	 * @return ����ʱ������ yyyy-MM-dd
	 */
	public static String getNowDateStr4() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);
		return dateString;
	}

	/**
	 * ��ȡ����ʱ��(String����)
	 * 
	 * @return ����ʱ������ yyyyMMddHHmmss
	 */
	public static String getNowDateStr2() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		String[] dateArray1 = dateString.split(" ");
		String[] dateArray2 = dateArray1[0].split("-");
		String[] dateArray3 = dateArray1[1].split(":");
		String result = dateArray2[0] + dateArray2[1] + dateArray2[2] + dateArray3[0] + dateArray3[1] + dateArray3[2];
		return result;
	}

	// ��ȡָ���·ݵ����һ��?
	public static int getMonthMaxDate(String year, String month) {

		Calendar a = Calendar.getInstance();

		// ����������Ϊ���µ�һ��
		a.set(Integer.valueOf(year), Integer.valueOf(month) - 1, 1);

		// ���ڻع�һ�죬Ҳ�������һ��?
		a.set(Integer.valueOf(year), Integer.valueOf(month) - 1, -1);

		int MaxDate = a.getActualMaximum(Calendar.DATE);

		return MaxDate;
	}

	// 上传文件
	public static StringBuffer uploadFile(MultipartFile[] fileList, String contextPath, String savePath, String webPath)
			throws FileNotFoundException, IOException {
		StringBuffer fileSavePath = new StringBuffer();

		for (MultipartFile file : fileList) {
			if (file.isEmpty()) {
				System.out.println("文件不存在，未上传成功");
			} else {

				String oldFileName = file.getOriginalFilename();

				String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
				String fileName = UUID.randomUUID().toString() + "." + ext.toLowerCase();

				String realPath = savePath + "/" + fileName;
				OutputStream output = new FileOutputStream(realPath);
				FileUtil.copyStream(file.getInputStream(), output);

				String webPath2 = webPath + "/" + fileName;
				fileSavePath.append(webPath2);
				fileSavePath.append(","); // 逗号分隔
			}
		}
		return fileSavePath;
	}

	public static String listToString(List<String> stringList, String spe) {
		if (stringList == null) {
			return null;
		}
		StringBuilder result = new StringBuilder();
		boolean flag = false;
		for (String string : stringList) {
			if (flag) {
				result.append(spe);
			} else {
				flag = true;
			}
			result.append(string);
		}
		return result.toString();
	}

	public static String getIp2(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (org.apache.commons.lang3.StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个ip值，第一个ip才是真实ip
			int index = ip.indexOf(",");
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		}
		ip = request.getHeader("X-Real-IP");
		if (org.apache.commons.lang3.StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			return ip;
		}
		return request.getRemoteAddr();
	}

	// 获取模版code
	public static String getTempletCode() {
		StringBuffer sb = new StringBuffer();
		sb.append("MB");
		sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		return sb.toString();
	}

	// 获取协议code
	public static String getProtocolCode() {
		StringBuffer sb = new StringBuffer();
		sb.append("YZ");
		sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		return sb.toString();
	}

	/**
	 *      * 从HTML源码中提取图片路径，最后以一个 String 类型的 List 返回，如果不包含任何图片，则返回一个 size=0 的List
	 *      * 需要注意的是，此方法只会提取以下格式的图片：.jpg|.bmp|.eps|.gif|.mif|.miff|.
	 * png|.tif|.tiff|.svg|.wmf|.jpe|.jpeg|.dib|.ico|.tga|.cut|.pic      * @param
	 * htmlCode HTML源码      * @return <img>标签 src 属性指向的图片地址的List集合      * @author
	 * Carl He      
	 */
	public static String changeImageSrc(String htmlCode) {

		String UPLOAD_PATH_IMG_UEDITOR_fire = File.separator + "attached" + File.separator + "TTHImg" + File.separator
				+ "word" + File.separator + "media";
		if (htmlCode != null) {
			Pattern p = Pattern.compile(
					"<img\\b[^>]*\\bsrc\\b\\s*=\\s*('|\")?([^'\"\n\r\f>]+(\\.jpg|\\.bmp|\\.eps|\\.gif|\\.mif|\\.miff|\\.png|\\.tif|\\.tiff|\\.svg|\\.wmf|\\.jpe|\\.jpeg|\\.dib|\\.ico|\\.tga|\\.cut|\\.pic)\\b)[^>]*>",
					Pattern.CASE_INSENSITIVE);
			Matcher m = p.matcher(htmlCode);
			String quote = null;
			String src = null;
			String filename = null;
			String newsrc = null;
			// String realpath =
			// request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
			while (m.find()) {
				quote = m.group(1);
				src = (quote == null || quote.trim().length() == 0) ? m.group(2).split("\\s+")[0] : m.group(2);
				// if (!src.contains("http")) {
				// filename = src.substring(src.lastIndexOf("/") + 1);
				// newsrc = UPLOAD_PATH_IMG_UEDITOR_fire+"/"
				// + filename;
				// htmlCode = htmlCode.replace(src, newsrc);
				// }

				filename = src.substring(src.lastIndexOf("/") + 1);
				newsrc = UPLOAD_PATH_IMG_UEDITOR_fire + "/" + filename;
				htmlCode = htmlCode.replace(src, newsrc);
			}
			return htmlCode;
		} else {
			return null;
		}

	}

	// /*从word模版中提取参数
	// * 去除\r\n
	// */
	// public static List<String> getParamFromWord(String wordContent){
	//
	// List<String> paramLst=new ArrayList<String>();
	// String[]
	// paramArray=com.qy.tools.StringUtils.replaceBlank(wordContent).split(CommonValue.PARAM_START_STR);
	// for(String ele:paramArray)
	// {
	// int endIndex=ele.indexOf(CommonValue.PARAM_START_END);
	//
	// if(endIndex>=0)
	// {
	// paramLst.add(ele.substring(0,endIndex));
	// }
	//
	// }
	// return paramLst;
	// }

	/*
	 * 从RTF流中提取参数
	 * 
	 */
	public static Map<String, Object> getParamFromRTFStrram(String rtfStrram) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Map<String, String> paramMap = new HashMap<String, String>();
		List<Integer> lstIndex = new ArrayList<Integer>();
		List<String> paramHasCharLst = new ArrayList<String>();
		List<String> paramLst = new ArrayList<String>();
		String rtnStr = rtfStrram;
		StringBuilder sb = new StringBuilder(rtfStrram);
		StringBuilder srcStr = new StringBuilder(rtfStrram);
		int indexFlag = rtfStrram.indexOf(CommonValue.PARAM_FLAG);

		try {
			if (indexFlag >= 0) {
				lstIndex.add(indexFlag);
			}
			while (indexFlag >= 0) {
				sb = sb.replace(indexFlag, indexFlag + 1, " ");
				indexFlag = sb.indexOf(CommonValue.PARAM_FLAG);
				if (indexFlag >= 0) {
					lstIndex.add(indexFlag);
				}
			}

			if (lstIndex.size() % 2 != 0) {
				lstIndex.remove(lstIndex.size() - 1);
			}
			String paramHasSpecChar = "";

			// 转义字符下标
			int indexTrans = -1;
			// 空格下标
			int indexBlank = -1;
			String hasSpecCharStr = "";
			String afterHandleParam = "";
			for (int i = 0; i < lstIndex.size();) {
				// System.out.println("i:"+i);
				// System.out.println("lstIndex.get(i):"+lstIndex.get(i));
				// System.out.println("lstIndex.get(i+1):"+lstIndex.get(i+1));
				paramHasSpecChar = srcStr.substring(lstIndex.get(i) + 1, lstIndex.get(i + 1));

				hasSpecCharStr = paramHasSpecChar;
				// System.out.println("paramHasSpecChar:"+paramHasSpecChar);
				paramHasCharLst.add(paramHasSpecChar);
				indexTrans = paramHasSpecChar.indexOf(CommonValue.PARAM_Trans);
				sb = new StringBuilder(paramHasSpecChar);
				while (indexTrans >= 0) {
					indexBlank = sb.indexOf(CommonValue.PARAM_Blank);
					sb = sb.replace(indexTrans, indexBlank + 1, "");
					indexTrans = sb.toString().indexOf(CommonValue.PARAM_Trans);
				}
				afterHandleParam = com.ccms.tools.StringUtils.replaceBlank(sb.toString()).replaceAll("\\{", "")
						.replaceAll("\\}", "");

				if (afterHandleParam.equals(CommonValue.NOT_PARAM_STR2)) {
					i = i + 2;
					continue;
				}

				paramLst.add(afterHandleParam);
				paramMap.put(hasSpecCharStr, afterHandleParam);
				i = i + 2;
			}
			for (Map.Entry<String, String> entry : paramMap.entrySet()) {

				rtnStr = rtnStr.replace(entry.getKey(), entry.getValue());
			}

			rtnMap.put("rtnCode", "0");
			rtnMap.put("paramLst", paramLst);
			rtnMap.put("content", rtnStr);
		} catch (Exception ex) {
			rtnMap.put("rtnCode", "500");
			rtnMap.put("paramLst", null);
			rtnMap.put("content", "");
			ex.printStackTrace();
		} finally {
			return rtnMap;
		}
	}

	/*
	 * 从word模版中提取参数
	 */
	public static List<String> getParamFromWord2(List<String> paramNameNoStyle, String wordContent) {

		List<String> paramLst = new ArrayList<String>();
		String[] paramArray = wordContent.split(CommonValue.PARAM_START_STR);
		for (String ele : paramArray) {
			int endIndex = ele.indexOf(CommonValue.PARAM_START_END);

			if (endIndex > 0) {
				String str = ele.substring(0, endIndex);
				if (paramNameNoStyle.contains(HTMLSpirit.delHTMLTag(str))) {
					paramLst.add(str);
				}
			}

		}
		return paramLst;
	}

	// 判断是否存在重复元素
	public static boolean hasSameInList(List<? extends Object> list) {
		if (null == list) {
			return false;
		}
		if (list.size() == new HashSet<Object>(list).size()) {
			return false;
		} else {
			return true;
		}
	}

	public static boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	// 日期比较，开始日期是否大于结束日期
	public static boolean compareDate(String start, String end) {
		start = start + " 00:00:00";
		end = end + " 00:00:00";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateBegin;
		Date dateEnd;
		try {
			dateBegin = formatter.parse(start);
			dateEnd = formatter.parse(end);
			if (dateBegin.after(dateEnd)) {
				return true;
			} else {
				return false;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	// 试用期判断
	public static boolean isShakedown(int year, int month, int day) {
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();// 获取一个Claender实例
		cal.set(year, month - 1, day);
		Date endDate;
		try {
			endDate = sf.parse(sf.format(cal.getTime()));
			if (date.getTime() > endDate.getTime()) {
				// System.out.println("CheckLoginFilter userid:"+userid);
				return true;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return true;
		}
		return false;
	}

	/**
	 * 得到几天后的时间
	 * 
	 * @param d
	 * @param day
	 * @return yyyy-MM-dd
	 */
	public static String getDateAfter(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + day);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(now.getTime());

		return dateString;
	}

	/**
	 * 得到几天前的时间
	 * 
	 * @param d
	 * @param day
	 * @return yyyy-MM-dd
	 */
	public static String getDateBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) - day);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(now.getTime());

		return dateString;
	}

	// yyyy-MM-dd
	public static Date convertStringToDate2(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date timeConvert = null;
		try {

			timeConvert = sdf.parse(date);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return timeConvert;
	}
}
