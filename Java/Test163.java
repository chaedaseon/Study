/*==================================
  ■■■ 컬렉션 (Collection) ■■■
===================================*/

// Test163 클래스를 완성하여 다음 기능을 가진 프로그램을 구현한다.

/*
실행 예)

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 1

1번째 요소 입력 : 최혜인
1번째 요소 입력 성공~!!!
요소 입력 계속(Y/N)? : y

2번째 요소 입력 : 채다선
2번째 요소 입력 성공~!!!
요소 입력 계속(Y/N)? : n

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 2

[벡터 전체 출력]
최혜인
채다선
벡터 전체 출력 완료~!!!

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 3

검색할 요소 입력 : 채다선

[검색 결과 출력]
항목이 존재합니다.

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 3

검색할 요소 입력 : 정현욱

[검색 결과 출력]
항목이 존재하지 않습니다.

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 4

삭제할 요소 입력 : 정한울

[삭제 결과 출력]
항목이 존재하지 않아 삭제할 수 없습니다.

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 4

삭제할 요소 입력 : 최혜인

[삭제 결과 출력]
최혜인 항목이 삭제되었습니다.

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 5

변경할 요소 입력 : 임하성

[변경 결과 출력]
변경할 대상이 존재하지 않습니다.

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 5

변경할 요소 입력 : 채다선
수정할 내용 입력 : 이주형

[변경 결과 출력]
변경이 완료되었습니다.

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 2

[벡터 전체 출력]
이주형
벡터 전체 출력 완료~!!!

	[ 메뉴 선택 ]=========
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	======================
>> 메뉴 선택(1~6) : 

프로그램 종료~!!!
계속하려면 아무 키나 누르세요...
*/

import java.util.Vector;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Enumeration;

class Menus		// → 완성
{
	public static final int E_ADD = 1;			//-- 요소 추가
	public static final int E_DISP = 2;			//-- 요소 출력
	public static final int E_FIND = 3;			//-- 요소 검색
	public static final int E_DEL = 4;			//-- 요소 삭제
	public static final int E_CHA = 5;			//-- 요소 변경
	public static final int E_EXIT = 6;			//-- 종료
}


public class Test163
{
	// 주요 속성 구성 → 완료
	private static final Vector<Object> vt;	//-- 자료구조
	private static BufferedReader br;		//-- 입력 시 활용
	private static Integer sel;				//-- 선택 값
	private static String con;				//-- 계속 진행 여부
	
	// static 초기화 블럭 → 완성
	static
	{
		// Vectpr 자료구조 생성
		vt = new Vector<Object>();

		// BufferedReader 객체 생성
		br = new BufferedReader(new InputStreamReader(System.in));

		// 사용자 입력값 초기화
		sel = 1;
		con = "Y";
	}



	// 메뉴 출력 메소드
	public static void menuDisp()
	{
		// 사용자에게 안내하기 위한 메세지만을 출력하는 기능
		// 메뉴를 선택하는 기능의 메소드(menuSelect())를 별도로 정의했기 때문에 
		// 이 과정에서는 사용자의 선택값을 받아오지 않아도 무방함.

		/* 내가 작성한 코드임----------------------------
		System.out.println("\t[ 메뉴 선택 ]=========");
		System.out.println("\t1. 요소 추가");
		System.out.println("\t2. 요소 출력");
		System.out.println("\t3. 요소 검색");
		System.out.println("\t4. 요소 삭제");
		System.out.println("\t5. 요소 변경");
		System.out.println("\t6. 종료");
		System.out.println("\t======================");
		System.out.print(">> 메뉴 선택(1~6) : ");
		-------------------------------------------------------*/

		System.out.println("\n\n\t[ 메뉴 선택 ]=========");
		System.out.println("\t1. 요소 추가");
		System.out.println("\t2. 요소 출력");
		System.out.println("\t3. 요소 검색");
		System.out.println("\t4. 요소 삭제");
		System.out.println("\t5. 요소 변경");
		System.out.println("\t6. 종료");
		System.out.println("\t==========================");

		System.out.print(">> 메뉴 선택(1~6) : ");
		
	}

	// 메뉴 선택 메소드
	public static void menuSelect() throws IOException, NumberFormatException
	{
		// 선택한 메뉴에 따른 기능 분기능
		// munuRun()에서 처리할 예정이기 때문에
		// 입력값을 받아오는 기능만 정의

		/* 내가 작성한 코드임--------------
		try
		{
			sel = Integer.parseInt(br.readLine());
		}
		catch (NumberFormatException e)
		{
			System.out.println(e.toString());
			System.out.println(">> 숫자 형태의 데이터를 입력해야 합니다.");
			sel = 0;
		}
		
		System.out.println();	
		---------------------------------------*/

		sel = Integer.parseInt(br.readLine());

	}

	// 선택된 메뉴 실행에 따른 기능 호출 메소드
	public static void menuRun() throws IOException
	{
		// 메뉴 클래스를 활용하여 처리
		switch (sel)
		{
		case Menus.E_ADD : addElement(); break;
		case Menus.E_DISP : disElement(); break;
		case Menus.E_FIND : findElement(); break;
		case Menus.E_DEL : delElement(); break;
		case Menus.E_CHA : chaElement(); break;
		case Menus.E_EXIT : exit(); break;	
		default : System.out.println("\t잘못된 메뉴 번호를 입력하였습니다.");
		}
	}

	// 자료구조에 요소 추가(입력) 메소드
	public static void addElement() throws IOException
	{	
		/* 내가 작성한 코드임--------
		do
		{
			int n = vt.size()+1;
			System.out.printf("%d번째 요소 입력 : ", n);
			String name = br.readLine();
			vt.add(name);
			System.out.printf("%d번째 요소 입력 성공~!!!\n",n);
			System.out.print("요소 입력 계속(Y/N)? : ");
			con = br.readLine();	
			
			if (con.toUpperCase().equals("N"))
			{
				break;
			}
			System.out.println();
		}
		while(!con.equals("y") || !con.equals("Y"));
		
		System.out.println();
		--------------------------------*/
		do
		{
			System.out.printf("\n\t%d번째 요소 입력 : ", vt.size()+1);
			String element = br.readLine();
			boolean b = vt.add(element);
			if (b)
			{
				System.out.printf("\n\t%d번째 요소 입력 성공~!!!\n", vt.size());
			}

			System.out.print("\n\t요소 입력 계속(Y/N) : ");
			con = br.readLine().toUpperCase();
		}
		while (con.equals("Y"));
	
			
	}

	// 자료구조 전체 요소 출력 메소드
	public static void disElement()
	{
		/* 내가 작성한 코드임------------------------	
		System.out.println("[벡터 전체 출력]");

		for (Object names : vt)
			System.out.println(names);
		
		System.out.println("벡터 전체 출력 완료~!!!");
		
		System.out.println();
		-------------------------------------------*/
		
		System.out.println("\n\t[벡터 전체 출력]");
		for (Enumeration e = vt.elements(); e.hasMoreElements(); )
		{
			System.out.printf("\t%10s\n", e.nextElement());
		}
		System.out.println("\t벡터 전체 출력 완료~!!!");

	}

	// 자료구조 내 요소 검색 메소드
	public static void findElement() throws IOException
	{
		/* 내가 작성한 코드임------------------
		String str1;
		System.out.print("검색할 요소 입력 : ");
		str1 = br.readLine();
		
		System.out.println();
		
		int i = vt.indexOf(str1);
		
		System.out.println("[검색 결과 출력]");
		if (vt.contains(str1))
		{
			System.out.println("항목이 존재합니다.");
		}
		else
			System.out.println("항목이 존재하지 않습니다");
			System.out.println();
			----------------------------------------*/

		System.out.println("검색할 요소 입력 : ");
		String element = br.readLine();

		System.out.println("\n\t[검색 결과 출력]");
		if (vt.contains(element))
		{
			System.out.println("항목이 존재합니다.");

			// 추가 확인
			int i = vt.indexOf(element);
			System.out.println("\t(" + element + " 위치 : " + i + ")");			// 요소가 어디 있는지 확인하는 코드까지 추가해줌
		}
		else
		{	
			System.out.println("항목이 존재하지 않습니다.");
		}
	}


	// 자료구조 내 요소 삭제 메소드
	public static void delElement() throws IOException
	{
		/* 내가 작성한 코드임-----------
		String str2;
		System.out.print("삭제할 요소 입력 : ");
		str2 = br.readLine();
		
		System.out.println();
		
		int i = vt.indexOf(str2);
		
		System.out.println("[삭제 결과 출력]");
		if (vt.contains(str2))
		{
			vt.remove(i);
			System.out.printf("%s 항목이 삭제되었습니다.", str2);
			System.out.println();
		}
		else
			System.out.println("항목이 존재하지 않아 삭제할 수 없습니다.");
		
		System.out.println();
		--------------------------------*/

		System.out.print("\n\t삭제할 요소 입력 : ");
		String element = br.readLine();

		System.out.print("\n\t[삭제 결과 출력]");
		if (vt.contains(element))
		{
			int i = vt.indexOf(element);
			vt.remove(i);

			System.out.println("\t" + element + " 항목이 삭제되었습니다.");

		}
		else
		{
			System.out.println("\t항목이 존재하지 않아 삭제할 수 없습니다.");
		}
		
	}

	// 자료구조 내 요소 수정(변경) 메소드
	public static void chaElement() throws IOException
	{
		/* 내가 작성한 코드임----------------------------------------
		String str3, str4;
		System.out.print("변경할 요소 입력 : ");
		str3 = br.readLine();
		
		int i = vt.indexOf(str3);
		
		if (vt.contains(str3))
		{
			System.out.print("수정할 내용 입력 : ");
			str4 = br.readLine();
			
			vt.set(i, str4);
			
			System.out.println();
			System.out.println("[변경 결과 출력]");
			System.out.println("변경이 완료되었습니다.");
			System.out.println();
		}
		else
		{
			System.out.println();
			System.out.println("[변경 결과 출력]");
			System.out.println("변경할 대상이 존재하지 않습니다.");
			System.out.println();
		}
		------------------------------------------------------*/
		
		System.out.print("\n\t변경할 요소 입력 : ");
		String oldElement = br.readLine();

		if (vt.contains(oldElement))
		{
			int i = vt.indexOf(oldElement);

			System.out.print("\t수정할 내용 입력 : ");
			String newElement = br.readLine();

			vt.set(i, newElement);

			System.out.println("\n\t[변경 결과 출력]");
			System.out.println("\t변경이 완료되었습니다.");
		}
		else
		{
			System.out.println("\n\t[변경 결과 출력]");
			System.out.println("\t변경할 대상이 존재하지 않습니다.");
		}
		

	
	}
 
	// 프로그램 종료 메소드 → 완성
	public static void exit()
	{
		System.out.println("\n프로그램 종료~!!!");
		System.exit(-1);
	}

	// main() 메소드 → 완성
	public static void main(String[] args) throws IOException, NumberFormatException
	{
		do
		{
			menuDisp();
			menuSelect();
			menuRun();
		}
		while (true);
	}
}

// equals 말고 == 쓰면 왜 안되는가?? → String!