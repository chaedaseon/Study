/*==================================
	MyData.java
	- 사용자 정의 데이터타입 활용
===================================*/

package com.test;

public class MyData
{
	// 주요 속성 구성
	private String name;
	private int age;
	
	// default 생성자 형태의 사용자 정의 생성자
	public MyData()
	{		
	}
	
	// 매개변수 2개 사용자 정의 생성자
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getAge()
	{
		return age;
	}
	public void setAge(int age)
	{
		this.age = age;
	}	
}
