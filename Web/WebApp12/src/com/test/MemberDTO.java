/*==================================================
	MemberDTO.java
	- 객체 전용(데이터 보관 및 전송) → JAVA Bean
===================================================*/

package com.test;

public class MemberDTO
{
	// 주요 속성 구성(프로퍼티 구성)
	private String sid, name, tel;		//-- 번호, 이름, 전화번호

	// getter / setter 구성
	public String getSid()
	{
		return sid;
	}

	public void setSid(String sid)
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
