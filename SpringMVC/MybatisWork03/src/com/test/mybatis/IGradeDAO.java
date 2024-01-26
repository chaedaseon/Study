/*=======================
	IGradeDAO.java
	- 인터페이스
=======================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IGradeDAO
{
	// 메소드 선언
	public ArrayList<GradeDTO> list();		// 성적정보 리스트 출력 메소드
	public int add(GradeDTO dto);			// 성적정보 입력 메소드
	public int remove(String sid);			// 성적정보 삭제 메소드
	public int modify(GradeDTO dto);		// 성적정보 수정 메소드
	public GradeDTO searchId(String sid);	// 성적정보 아이디검색 메소드
	
}
