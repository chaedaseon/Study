/*==============================================
	RecordViewImpl.java
	- 클래스
	- RecordView 인터페이스를 구현하는 클래스
===============================================*/

package com.test.spr;

import java.util.Scanner;

public class RecordViewImpl implements RecordView
{
	// 주요 속성 구성 → 특정 클래스 타입이 아닌... 인터페이스 타입
	private Record record;
	
	// RecordView 인터페이스 메소드 재정의
	
	@Override
	public void setRecord(Record record)
	{
		this.record = record;		
	}

	@Override
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("국어 영어 수학 점수입력(공백구분) : ");
		String kor = sc.next();
		String eng = sc.next();
		String mat = sc.next();
		
		record.setKor(Integer.parseInt(kor));
		record.setEng(Integer.parseInt(eng));
		record.setMat(Integer.parseInt(mat));
		
		sc.close();		                      
	}

	@Override
	public void output()
	{
		System.out.println("  국어  영어  수학   총점   평균");
		System.out.printf("%6d %5d %5d %6d %6.1f%n"
						, record.getKor(), record.getEng(), record.getMat()
						, record.getTotal(), record.getAvg());
		
	}
	
}
