/*=======================
	IStudentDAO.java
	- 인터페이스
=======================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IStudentDAO
{
	// 메소드 선언
	public ArrayList<StudentDTO> list();	// 전체 학생 리스트 출력 메소드
	public int add(StudentDTO dto);			// 학생정보 입력 메소드
	public int count();						// 학생 수 출력 메소드
	public int maxNum();					// 학생번호 최대값 찾는 메소드
	public int modify(StudentDTO dto);		// 학생정보 수정 메소드
	public StudentDTO searchId(String sid);	// 학생정보 아이디검색 메소드
	public int remove(String sid);			// 학생정보 삭제 메소드
}
