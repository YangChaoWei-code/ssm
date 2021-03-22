package com.ssm;

public class HelloSpring {
	
	private String userName;
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void show() {
		System.out.println(userName+":欢迎您来学习Spring框架！");
	}
	
	
}
