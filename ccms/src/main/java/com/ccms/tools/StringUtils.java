package com.ccms.tools;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class StringUtils {
	
	public static String replaceBlank(String str) {
		String dest = "";
		if (str!=null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(str);
			dest = m.replaceAll("");
		}
		return dest;
	}
	
	public static boolean isContainBlank(String str) {
		if (str!=null) {
			if(str.indexOf(" ")>=0)
			{
				return true;
			}else if(str.indexOf("\t")>=0)
			{
				return true;
			}else if(str.indexOf("\n")>=0)
			{
				return true;
			}else if(str.indexOf("\r\n")>=0)
			{
				return true;
			}else
			{
				return false;
			}
		}else
		{
		
			return false;
		}
	}

	
	public static void main(String[] args) {
	}

}
