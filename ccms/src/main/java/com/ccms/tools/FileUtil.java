package com.ccms.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileUtil {
	
	
	public static void main(String[] args) throws IOException {
	    System.out
	        .println(readFromFile("D:/bestjj03/tools/apache-tomcat-7.0.52/apache-tomcat-7.0.52/webapps/ShebaoProtocol/attached/TempletFile/20170228151706203.doc"));
	    
	    }
	
	public static String readFromFile(String filePath) throws IOException {
		BufferedReader bufferedReader=null;
		FileReader fr=null;
        try {
        	File src=new File(filePath);
        	fr=new FileReader(src);
            bufferedReader = new BufferedReader(fr);
            StringBuilder stringBuilder = new StringBuilder();
            String content;
            while((content = bufferedReader.readLine() )!=null){
                stringBuilder.append(content);
            }
            return stringBuilder.toString();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        finally
        {
        	
        	if(fr!=null)
        	{
        		fr.close();
        	}
        	
        	if(bufferedReader!=null)
        	{
        		bufferedReader.close();
        	}
 
        }

    } 

}
