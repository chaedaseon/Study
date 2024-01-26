/*=====================
	IMemberDAO.java
	- 인터페이스
=====================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IMemberDAO
{
	public ArrayList<MemberDTO> list();
	public int count();
	public int add(MemberDTO m);
	
	/* 삭제 기능 처리 ② */
	public int remove(String mid);
}
