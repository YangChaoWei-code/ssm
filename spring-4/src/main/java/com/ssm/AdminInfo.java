package com.ssm;

public class AdminInfo {
	private int id;
	private String name;
	private String pwd;
	
	public void setId(int id) {
		this.id = id;
	}	
	public void setName(String name) {
		this.name = name;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public AdminInfo() {
		// TODO Auto-generated constructor stub
	}
	public AdminInfo(String name, String pwd) {
		super();
		this.name = name;
		this.pwd = pwd;
	}
	public void print() {
		System.out.println(id+" -- "+name+" -- "+pwd);
	}

}
