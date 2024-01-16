package com.test;

public class FriendDTO
{
	// 주요 속성 구성
	private String name;		//-- 이름
	private int age;			//-- 나이	String age;
	private String radio;		//-- 성별
	private String[] check;		//-- 이상형
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//   (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//   배열로 처리할 수 있다.
	
	// getter / setter 구성
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
	public String getRadio()
	{
		return radio;
	}
	public void setRadio(String radio)
	{
		this.radio = radio;
	}
	public String[] getCheck()				// check~!!!
	{
		return check;
	}
	public void setCheck(String[] check)	// check~!!!
	{
		this.check = check;
	}
	
	/*
	public String checkRes()
	{
		String result = "";
		
		for (int i=0; i<check.length; i++)
		{
			result += "[" + String.format("%s", check[i]) + "]";
		}
		
		return result;
	}
	*/
}
