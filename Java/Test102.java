/*==================================
   ■■■ 클래스와 인스턴스 ■■■
	- 클래스와 인스턴스 활용
  ==================================*/
  
  // 1 ~ 3 사이의 난수를 발생시켜서
  // 가위, 바위, 보 게임 프로그램을 구현한다.
  // 단 클래스의 개념을 활용하여 처리할 수 있도록 한다.
  // 또한 배열을 활용하여 처리할 수 있도록 한다.
  // 최종적으로 RpsGame 클래스 완성 할 수 있도록 한다.
  
  // ※ 기준 데이터 → 1.가위 2.바위 3.보

  // 실행 예) 
  // 1.가위 2.바위 3.보 : 4
  // 1.가위 2.바위 3.보 : -2
  // 1.가위 2.바위 3.보 : 2

  // - 유저	  : 바위 
  // - 컴퓨터 : 보

  // >> 승부 최종 결과 : 컴퓨터 이겼습니다~!!
  // 계속하려면 아무 키나 누르세요

import java.util.Random;
import java.util.Scanner;

class RpsGame
{
	// 주요 변수 선언		
	int n;										// 사용자가 입력한 숫자
	int rd;										// 난수 값을 담아둘 변수 
	String[] arr = {" ","가위", "바위", "보"};		// 가위,바위,보 변수 선언 

	// 주요 기능 선언
	// ① 사용자로부터 가위바위보 입력 받는 기능
	void input()
	{
		Scanner sc = new Scanner(System.in);
		do
		{
			System.out.print("1.가위 2.바위 3.보 : ");
			n = sc.nextInt();
		}
		while (3<n || n<1);
		
	}
		
	// ③ 난수 발생 시키기
	void RanInput()
	{
		Random rdc = new Random();
		rd = rdc.nextInt(3)+1;	
	}

	// ④ 비교하고 출력하기
	void print()
	{
		System.out.println(" - 유저   : " + arr[n]);
		System.out.println(" - 컴퓨터 : " + arr[rd]);

		/*if ( n < rd )
		{
			System.out.println("")
		}
		*/
	}
}

public class Test102
{
	public static void main(String[] args)
	{
		RpsGame rg = new RpsGame();
		rg.input();
		rg.print();
	}
}