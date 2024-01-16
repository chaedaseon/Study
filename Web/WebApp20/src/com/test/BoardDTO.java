/*===================
	BoardDTO.java
====================*/

package com.test;

public class BoardDTO
{
	// TBL_BOARD 테이블의 레코드 구조와 동일한 속성 구성
	private int num;
	private String name, pwd, email, subject, content, ipAddr, created;
	private int hitCount;
	
	// 사용자 정의 생성자를 정의하지 않음
	// → default 생성자 자동 삽입
	
	// getter / setter 구성
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getPwd()
	{
		return pwd;
	}
	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getIpAddr()
	{
		return ipAddr;
	}
	public void setIpAddr(String ipAddr)
	{
		this.ipAddr = ipAddr;
	}
	public String getCreated()
	{
		return created;
	}
	public void setCreated(String created)
	{
		this.created = created;
	}
	public int getHitCount()
	{
		return hitCount;
	}
	public void setHitCount(int hitCount)
	{
		this.hitCount = hitCount;
	}
		
}
