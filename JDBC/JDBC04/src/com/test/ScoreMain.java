/*====================
	ScoreMain.java
=====================*/
/*
○ 성적 처리
   - 데이터베이스 연동(데이터베이스 연결 및 액션 처리)
   - ScoreDTO 클래스 활용 (속성만 존재하는 클래스, getter / setter 구성)
   - ScoreDAO 클래스 활용 (데이터베이스 액션 처리)
   - Process 클래스 활용 (업무 단위 기능 구성)
   - DBConn 클래스 활용 (데이터베이스 연결 전감 전용 객체 처리)
   
여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
총점, 평균, 석차 등을 계산하여 출력하는 프로그램을 구현한다.
※ 서브 메뉴 구성 → Process 클래스 활용

실행 예)

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 1

4번 학생 성적 입력(이름 국어 영어 수학) : 박범구 50 60 70
성적 입력이 완료되었습니다.

5번 학생 성적 입력(이름 국어 영어 수학) : 김경태 80 80 80
성적 입력이 완료되었습니다.

6번 학생 성적 입력(이름 국어 영어 수학) : .

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 2

전체 인원 : 5명
번호	이름	국어	영어	수학	총점	평균	석차
 1	   
 2
 3								....
 4
 5

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : -1

프로그램이 종료되었습니다.
*/

package com.test;

import java.util.Scanner;

public class ScoreMain
{
	public static void main(String[] args)
	{
		Process prc = new Process();
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.println("");
			System.out.println("===[ 성적 처리 ]===");
			System.out.println("1. 성적 입력");
			System.out.println("2. 성적 전체 출력");
			System.out.println("3. 이름 검색 출력");
			System.out.println("4. 성적 수정");
			System.out.println("5. 성적 삭제");
			System.out.println("===================");
			System.out.print(">> 선택(1~5, -1종료) : ");
			String menus = sc.next();
			
			try
			{
				int menu = Integer.parseInt(menus);
				
				if (menu == -1)
				{
					System.out.println();
					System.out.println("프로그램이 종료되었습니다.");
					return;
				}
				
				switch (menu)
				{
					case 1:
						// 성적 입력 기능 수행
						prc.sungjukInsert();
						break;
					case 2:
						// 성적 전체 출력 기능 수행
						prc.sungjukSelectAll();
						break;
					case 3:
						// 이름 검색 출력 기능 수행
						prc.sungjukSearchName();
						break;
					case 4:
						// 성적 수정 기능 수행
						prc.sungjukUpdate();
						break;
					case 5:
						// 성적 삭제 기능 수행
						prc.sungjukDelete();
						break;
				}
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}			
		} while (true);
		
	}
}

// 실행 결과
/*
===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 1

6번 학생 성적 입력(이름 국어 영어 수학) : 최혜인 90 90 90
성적 입력이 완료되었습니다.

7번 학생 성적 입력(이름 국어 영어 수학) : .

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 2

전체 인원 : 6명
번호	이름	국어	영어	수학	총점	평균	석차
  1    김민지     100     90      80     270     90.0      2
  2    이주형      10     10      10      30     10.0      6
  3    김동민      50     50      50     150     50.0      5
  4    채다선     100    100     100     300    100.0      1
  6    김경태      80     80      80     240     80.0      4
  7    최혜인      90     90      90     270     90.0      2

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 3
검색할 이름 입력 : 채다선
번호	이름	국어	영어	수학	총점	평균	석차
  4    채다선     100    100     100     300    100.0      1

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 4
수정할 번호를 입력하세요 : 
6
번호	이름	국어	영어	수학	총점	평균	석차
  6    김경태      80     80      80     240     80.0      4

수정 데이터 입력(이름 국어 영어 수학) : 김경태 50 50 50
수정이 완료되었습니다.

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 2

전체 인원 : 6명
번호	이름	국어	영어	수학	총점	평균	석차
  1    김민지     100     90      80     270     90.0      2
  2    이주형      10     10      10      30     10.0      6
  3    김동민      50     50      50     150     50.0      4
  4    채다선     100    100     100     300    100.0      1
  6    김경태      50     50      50     150     50.0      4
  7    최혜인      90     90      90     270     90.0      2

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 5
삭제할 번호 입력 : 3
번호	이름	국어	영어	수학	총점	평균	석차
  3    김동민      50     50      50     150     50.0      4
>> 정말 삭제하시겠습니까?(Y/N) : n
취소되었습니다.

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 5
삭제할 번호 입력 : 3
번호	이름	국어	영어	수학	총점	평균	석차
  3    김동민      50     50      50     150     50.0      4
>> 정말 삭제하시겠습니까?(Y/N) : y
삭제가 완료되었습니다.

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 2

전체 인원 : 5명
번호	이름	국어	영어	수학	총점	평균	석차
  1    김민지     100     90      80     270     90.0      2
  2    이주형      10     10      10      30     10.0      5
  4    채다선     100    100     100     300    100.0      1
  6    김경태      50     50      50     150     50.0      4
  7    최혜인      90     90      90     270     90.0      2

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : -1

프로그램이 종료되었습니다.
*/