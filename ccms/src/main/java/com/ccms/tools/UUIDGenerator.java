package com.ccms.tools;
  
import java.util.UUID;

public class UUIDGenerator {
	public static String getUUID()
	{
		return UUID.randomUUID().toString();
	}
	
	
	public static void main(String[] args) {
		System.out.println(getUUID());
	}
}
