/*========================================
  ■■■ 주민등록번호 유효성 검사 ■■■
- 다음과 같은 기능의 프로그램을 구현한다.
=========================================*/

/*
○ 주민등록번호 검증 공식

	① 마지막 자리를 제외한 앞자리 수를 규칙에 맞게 곱한다.
		
		123456-1234567 (주민번호)
		****** ******  ------------------ 각 자릿수에 곱하기
		234567 892345  (각 자릿수에 곱해질 수)

	② 규칙에 맞게 곱셈 연산을 수행한 결과를 모두 더한다.

	ex) 7 5 0 6 1 5 - 1 8 6 2 1 3 3
		* * * * * *   * * * * * *
		2 3 4 5 6 7   8 9 2 3 4 5
		---------------------------
		→ 14 + 15 + 0 + 30 + 6 + 35 + 8 + 72 + 12 + 6 + 4 + 15 == 217

	③ 더해진 결과값을 11로 나누어 『나머지』를 취한다.
		
		  19 → 몫(Ⅹ)
	    -------
	11 | 217
	     11
	    -------
		 107
		  99
		-------
		   8 → 나머지(○)

	④ 11 에서 나머지(8)를 뺀 결과값을 구한다.

		11 - 8 → 3

		※ ③의 처리 과정에서 나머지가 0인 경우 → 11 - 0 → 11
		   ③의 처리 과정에서 나머지가 1인 경우 → 11 - 1 → 10

		   이를 다시 10으로 나누어 나머지를 취한다.		11 → 1
		   												10 → 0
	
	⑤ ④의 연산 결과가 주민번호를 구성하는 마지막 숫자와
	   일치하는지의 여부를 비교하여 확인한다.

	   일치		→ 유효한 주민번호
	   불일치	→ 잘못된 주민번호
*/

// 실행 예)
// 주민번호입력(xxxxxx-xxxxxxx) : 123456-12345678		//-- 입력 갯수 초과
// >> 입력 오류~!!!
// 계속하려면 아무 키나 누르세요...

// 실행 예)
// 주민번호입력(xxxxxx-xxxxxxx) : 123456-123456			//-- 입력 갯수 미달
// >> 입력 오류~!!!
// 계속하려면 아무 키나 누르세요...

// 실행 예)
// 주민번호입력(xxxxxx-xxxxxxx) : 750615-1252085		//-- 유효한 주민번호
// >> 정확한 주민번호~!!!
// 계속하려면 아무 키나 누르세요...

// 실행 예)
// 주민번호입력(xxxxxx-xxxxxxx) : 750615-1252086	//-- 잘못된 주민번호
// >> 잘못된 주민번호~!!!
// 계속하려면 아무 키나 누르세요...

// ※ 문제 해결을 위한 추가 팁~!!!

//	  배열.length			→ 배열의 길이(배열방의 갯수) 반환
//	  문자열.length()		→ 문자열의 길이 반환

//	  문자열.substring(m, n)→ 문자열 추출
//	  문자열 m번째 위치에서 n-1번째 위치까지 추출(인덱스는 0부터)

//	  문자열.substring(m)→ 문자열 추출
//	  문자열 m번째 위치에서 문자열의 끝까지 추출(인덱스는 0부터)

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test106
{
	public static void main(String[] args) throws IOException
	{
		// 테스트(문자열.length())
		/*
		String strTemp = "채다선";
		System.out.println(strTemp.length());
		//--==>> 3

		strTemp = "채다선리수리마수리";
		System.out.println(strTemp.length());
		//--==>> 9

		strTemp = "동해물과 백두산이 마르고 닳도록";
		System.out.println(strTemp.length());
		//--==>> 17

		strTemp = "study-hard";
		System.out.println(strTemp.length());
		//--==>> 10
		*/
		//-------------------------------------------
		
		// 테스트(문자열.substring(m, n))
		/*
		String strTemp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println(strTemp.substring(13,17));
		//--==>> NOPQ

		//System.out.println(strTemp.substring(13,53));
		//--==>> 에러 발생(런타임 에러)
		//		 StringIndexOutOfBoundsException

		System.out.println(strTemp.substring(13));
		//--==>> NOPQRSTUVWXYZ
		*/

		// 내가 풀이한 내용-----------------------------------------------------------------
	/*	
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int[] idnum = new int[13];		// 주민번호 숫자를 담을 배열 선언
		String input;					// 주민번호 입력값을 받을 변수
		int sum=0;						// 규칙에 맞게 곱셈 연산을 수행한 결과를 담을 변수
		int temp, result;				// 계산한 나머지와 최종결과값을 담을 변수				
		
		// 입력 메세지 출력
		System.out.print("주민번호입력(xxxxxx-xxxxxxx) : ");	
		input = br.readLine();

		if (input.length()<14 || input.length()>14)		// 입력한 주민번호가 14보다 작거나 클 경우
		{
			System.out.println(">> 입력 오류~!!!");
			return;
		}
		
		for (int i=0; i<13; i++)
		{
			if (i<6)
				idnum[i] = Integer.parseInt(input.substring(i, i+1));
			else
				idnum[i] = Integer.parseInt(input.substring(i+1, i+2));
		}
	
		for (int i=0, n=1; i<8; i++)
		{
			n++;
			sum += (idnum[i] * n);
		}
		for (int i=8, n=1; i<12; i++)
		{
			n++;
			sum += (idnum[i] * n);
		}
		
		temp=sum%11;				// 더해진 결과값을 11로 나누어 『나머지』를 취한다.

		if (temp==0 || temp==1)
			result=(11-temp)%10;
		else
			result=11-temp;			// 11 에서 나머지를 뺀 결과값을 구한다.

			
		// 결과 출력
		if (result==idnum[12])
			System.out.println(">> 정확한 주민번호~!!!");
		else
			System.out.println(">> 잘못된 주민번호~!!!");
	}

*/
	// 함께 풀이한 내용-------------------------------------------------------------
	// BufferedReader 인스턴스 생성
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

	// 입력받은 주민번호(문자열 형태)를 담아둘 변수 선언
	String str;

	// 공식에 따라 주민번호의 각 자릿수에 곱하게 될 수 → 배열 형태로 구성
	int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5};
	//			 7  5  0  6  1  5  -  1  2  5  2  0  8  5
	//							  ---
	//							check~!!!

	// 곱셈 연산 후 누적합 → (각 곱셈의 결과를 더해나가라...)
	//				------
	int tot = 0;

	System.out.print("주민번호입력(xxxxxx-xxxxxxx) : ");	// "750615-1252085"
	//Integer.parseInt(br.readLine());
	str = br.readLine();

	if (str.length() != 14)
	{
		System.out.println(">> 입력 오류~!!!");
		return;			//-- 메소드 종료 → main() 메소드 종료 → 프로그램 종료
	}

	// 테스트 
	//System.out.println(">> 자릿수 적합~!!!");
	// ex) "750615-1252085"

		for (int i=0; i<13; i++)	// -- i → 0 1 2 3 4 5 6 7 8 9 10 11 12
		{		
			//테스트
			//System.out.print(i + " ");
			//--==>> 0 1 2 3 4 5 6 7 8 9 10 11 12

			// i가 6일 때에는 뒷부분 무시하고 계속해라
			if (i==6)
			{
				continue;						// 뒷부분 무시하고 계속해라~~!!! 
			}

			tot += chk[i] * Integer.parseInt(str.substring(i, (i+1)));		// -- 뒷부분

			//테스트
			//System.out.println("tot : " + tot);
			//--==>> tot : 217
			//----------------------여기까지 수행하면 검증 공식의 ①과 ②를 모두 끝낸 상황이며 
			//						규칙에 맞게 곱셈 연산을 수행한 결과를 모두 더한 값은
			//						변수 tot에 담겨있는 상태가 된다.

		}

		
			int su = 11 - tot %11;

			//--------------------- 여기까지 수행하면 검증공식의 ③과 ④를 모두 끝낸 상황이며
			//						su에 대한 연산 결과가 두 자리의 정수로 나올 경우
			//						주민번호 마지막 자리의 숫자와 비교를 수행할 수 없는 상황.

			su = su % 10;		// su %= 10; 과 같은코드 

			// 주민번호의 마지막 자리와 비교한 결과가 같다면 → 정확한 주민번호
			//										아니라면 → 잘못된 주민번호
			if (su == Integer.parseInt(str.substring(13)))
			{
				System.out.println(" >> 정확한 주민번호~~!!");
			}
			else
			{
				System.out.println(" >> 잘못된 주민번호~~!!");
			}

   }	
}