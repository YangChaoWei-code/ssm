package com.ccms.DocUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher; 
import java.util.regex.Pattern; 
import com.ccms.tools.FileUtil;
public class HTMLSpirit {
	public static String delHTMLTag(String htmlStr){ 
        String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式 
        String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式 
        String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式 
         
        Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
        Matcher m_script=p_script.matcher(htmlStr); 
        htmlStr=m_script.replaceAll(""); //过滤script标签 
         
        Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
        Matcher m_style=p_style.matcher(htmlStr); 
        htmlStr=m_style.replaceAll(""); //过滤style标签 
         
        Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
        Matcher m_html=p_html.matcher(htmlStr); 
        htmlStr=m_html.replaceAll(""); //过滤html标签 

        return htmlStr.trim(); //返回文本字符串 
    } 
	
	
	@SuppressWarnings("finally")
	public static String transformParamStyle(String paramStyle,String paramKey,String paramValue,String replaceFlag){ 
       
		//返回值
		String returnStr=null;
//		String replaceFlag="${}$";
//		String replaceFlag=CommonTool.PARAM_START_STR2+CommonTool.PARAM_START_END;
		
		try
		{
			String[] paramStyleDelHtmlAfterArray=paramStyle.split("<");
			List<String> paramPartList=new ArrayList<String>();
			int count=0;
			for(String ele:paramStyleDelHtmlAfterArray)
			{
				String trans=delHTMLTag("<"+ele);
				if(!trans.isEmpty())
				{
					if(paramKey.contains(trans))
					{
						paramPartList.add(trans);
						count++;
					}
				}
			}
			
			StringBuffer bufferTT1 = new StringBuffer(paramStyle);
			for(int i=0;i<paramPartList.size();i++)
			{
				int indexBegin=bufferTT1.toString().indexOf(paramPartList.get(i));
				int indexEnd=indexBegin+paramPartList.get(i).length();
				if(i==0)
				{
					bufferTT1=bufferTT1.replace(indexBegin, indexEnd, replaceFlag);
				}else
				{
					bufferTT1=bufferTT1.replace(indexBegin, indexEnd, "");
					
				}
				
			}
			returnStr=bufferTT1.toString().replace(replaceFlag, paramValue);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			return returnStr;
		}
    } 
	
	
	public static void main(String[] args) throws IOException {
		String tt1="</FONT></SPAN></FONT><FONT FACE=\"仿宋_GB2312, monospace\"><FONT SIZE=2>是否这个参数能找到吗？不知道啊			 好把</FONT></FONT><FONT FACE=\"Times New Roman, serif\"><SPAN LANG=\"en-US\"><FONT SIZE=2>";
//		String tt1="</FONT></SPAN></FONT><FONT FACE=\"仿宋_GB2312, monospace\"><FONT SIZE=4>乙方方日工作日工作日</FONT></FONT><FONT SIZE=4></FONT><FONT SIZE=4></FONT><FONT SIZE=4></FONT><FONT FACE=\"仿宋_GB2312, monospace\"><FONT SIZE=4></FONT></FONT><FONT FACE=\"Times New Roman, serif\"><SPAN LANG=\"en-US\"><FONT SIZE=4>";
//		String tt1="</FONT></SPAN></FONT><FONT FACE=\"仿宋_GB2312, monospace\"><FONT SIZE=4>乙方</FONT></FONT><FONT SIZE=4>方</FONT><FONT SIZE=4>日</FONT><FONT SIZE=4>工作日</FONT><FONT FACE=\"仿宋_GB2312, monospace\"><FONT SIZE=4>工作日</FONT></FONT><FONT FACE=\"Times New Roman, serif\"><SPAN LANG=\"en-US\"><FONT SIZE=4>";
		
		String paramStr= transformParamStyle(tt1,"是否这个参数能找到吗？不知道啊			 好把","11个工作日","{}");
		
		
		System.out.println("paramStr:"+paramStr);
		
		
		String templetCntent=FileUtil.readFromFile("D:/bestjj03/tools/apache-tomcat-7.0.52/apache-tomcat-7.0.52/webapps/ShebaoProtocol/attached/TempletTransHtml/1488266639296.html");
		
		System.out.println("templetCntent:"+delHTMLTag(templetCntent));
	}

}
