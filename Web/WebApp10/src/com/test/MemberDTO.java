/*====================================
	MemberDTO.java
	- 데이터 보관 및 전송 객체 활용
=====================================*/

package com.test;

public class MemberDTO
{
	// 주요 속성 구성
	private String sid, name, tel;
	//-- TBL_MEMBER 테이블의 컬럼 구조
	
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
