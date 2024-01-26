/*=======================
	StudentDTO.java
=======================*/

package com.test.mybatis;

public class StudentDTO
{
	// 주요 속성 구성
	private int sid;
	private String name, tel;
	private int sub;
	

	// getter / setter 구성
	public int getSub()
	{
		return sub;
	}
	
	public void setSub(int sub)
	{
		this.sub = sub;
	}
	
	public int getSid()
	{
		return sid;
	}

	public void setSid(int sid)
	{
		this.sid = sid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

}
