/*=====================
 	MemberDTO.java
======================*/
/*
○ TBL_MEMBER 테이블을 활용하여
   이름과 전화번호를 여러 건 입력받고, 전체 출력하는 프로그램을 구현한다.
   단, 데이터베이스 연동이 이루어져야 하고
   MemberDAO, MemberDTO 클래스를 활용해야 한다.
   
실행 예)

이름 전화번호 입력(2) : 임하성 010-2222-2222
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(3) : 김민지 010-3333-3333
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(4) : .

-------------------------------
전체 회원 수 : 3명
-------------------------------
번호	이름	전화번호
1	   이윤수  010-1111-1111
2	   임하성  010-2222-2222
3	   김민지  010-3333-3333
-------------------------------

*/
package com.test;

public class MemberDTO
{
	// 주요 속성 구성
	private String sid, name, tel;
	
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

