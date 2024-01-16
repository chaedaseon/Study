/*=============================================
  ■■■ 자바의 주요(중요) 클래스 ■■■
  - 자바에서 기본적으로 제공하는 주요 클래스들
  - Random 클래스
==============================================*/

/*
○ java.util.Ranodm 클래스는

   여러 형태의 난수를 발생시켜 제공하는 클래스이다.
   Math 클래스의 정적 메소드인 random() 메소드도 난수를 제공하는 메소드이지만
   0.0 ~ 1.0 사이의 실수 형태만 발생하게 되므로
   필요한 형태의 난수를 만들어내기 위해서는 추가적인 연산을 여러 형태로 수행해야 한다.
   그래서 자바는 여러 형태의 난수를 발생시켜주는
   전용 클래스인 Random 클래스를 별도로 제공하고 있다.
*/

// 로또 번호 생성(난수 발생 프로그램)

// 프로그램이 실행되면...
// 기본적으로 로또 5게임을 수행하는 프로그램을 구현한다.

// 실행 예)
//   3 12 15 24 31 41
//   1 12 18 36 41 52
//   4  9 12 13 22 30
//   5 10 13 14 22 40
//  22 31 36 40 43 44
// 계속하려면 아무 키나 누르세요...

/* 내가 작성한 코드-----------------------------------------------
import java.util.Random;

class Lotto
{
	// 배열 변수 선언 및 메모리 할당 → 로또 번호를 담아둘 배열방 6칸
	private int[] num;

	// 생성자
	Lotto()
	{
		num = new int[6];
	}

	public int[] getNum()
	{
		sorting();
		return num;
	}

	// 6개의 난수를 발생시키는 메소드 정의
	public void start()
	{
		Random rd = new Random();
		for (int i=0; i<6; i++)
		{
			num[i] = rd.nextInt(45)+1;
			
			for (int j=0; j<i; j++)
			{
				if (num[i] == num[j])
				{
					i--;
				}
			}
		}
		
	}
	
	// 정렬 메소드 정의
	private void sorting()
	{
		for (int i=0 ;i<num.length-1 ;i++ )
		{
			for (int j=i+1; j<num.length; j++)
			{
				if (num[i]>num[j])
				{
					num[i]=num[i]^num[j];
					num[j]=num[j]^num[i];
					num[i]=num[i]^num[j];
				}
			}
		}
	}

}
	

public class Test146
{
	public static void main(String[] args)
	{
		// Lotto 클래스 기반 인스턴스 생성
		Lotto lotto = new Lotto();
		
		// 기본 5게임

		for (int i=0; i<5; i++)
		{
			// 로또 1게임 수행
			lotto.start();
			int[] rdArr = lotto.getNum();
			
			// 결과 출력
			for (int j=0; j<6; j++)
			{
				System.out.printf("%3d", rdArr[j]);
			}
			System.out.println();
		
		}
	}
}
--------------------------------------------------------------*/

// 같이 작성한 코드

import java.util.Random;
import java.util.Arrays;

class Lotto
{
	// 배열 변수 선언 및 메모리 할당 → 로또 번호를 담아둘 배열방 6칸
	private int[] num;

	// 생성자
	Lotto()
	{
		num = new int[6];
	}

	public int[] getNum()
	{
		return num;
	}

	// 6개의 난수를 발생시키는 메소드 정의
	public void start()
	{
		// Random 인스턴스 생성
		Random rd = new Random();
		int n;
		int cnt = 0;

		jump:							// 여기로 빠져나간다. 세미콜론 아닌 콜론 사용! 빈번한 사용은 비추

		while (cnt < 6)					// cnt → 0 1 2 3 4 5
		{
			n = rd.nextInt(45) + 1;		// 0 ~ 44 → 『+1』 → 1 ~ 45

			for (int i=0; i<cnt; i++)
			{
				// num[i] 요소와 n 을 비교
				if (num[i] == n)
					continue jump;			// 여기에서 ↑ 코드 설명 : 중복된 값이 생겼어 그럼 jump해서 위로 빠져나가서 다시 비교해보자~
			}

			num[cnt++] = n;
		}

		// 정렬 메소드 호출
		sorting();
		
	}
	
	// 정렬 메소드 정의
	private void sorting()
	{
		Arrays.sort(num);
	}

}




public class Test146
{
	public static void main(String[] args)
	{
		// Lotto 클래스 기반 인스턴스 생성
		Lotto lotto = new Lotto();

		// 기본 5 게임
		for (int i=1; i<=5; i++)
		{
			// 로또 1게임 수행
			lotto.start();

			// 결과 출력
			for (int n : lotto.getNum())
			{
				System.out.printf("%3d", n);
			}
			System.out.println();
		}
		
	}
}

// 실행 결과
/*
  2 14 17 28 32 45
  7  9 21 28 35 44
  3  8 17 21 25 45
  2  4 11 27 29 35
 11 14 15 25 39 41
계속하려면 아무 키나 누르십시오 . . .
*/

/*
  9 14 17 35 38 43
  5  9 24 29 33 37
  4 11 17 22 24 40
  5  8 15 25 30 43
  6 15 26 32 41 45
계속하려면 아무 키나 누르십시오 . . .
*/