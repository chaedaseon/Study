import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;


public class SemiProject
{
	public static void main(String[] args) throws IOException
	{
		String number;
		int[] num = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5};
		int total = 0;
		int result, a;

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.println("성인 여부 확인을 위해 주민등록번호를 입력해주세요(- 포함하여 입력 요망)");
		number = br.readLine();

		if (number.length() != 14)
		{
			System.out.println("주민등록번호에 맞는 형식이 아닙니다. 다시 입력해주세요.");
			return;
		}
		for (int i=0; i<13; i++)
		{
			if ((i==6))
			{
				continue;
			}
			total += num[i] * Integer.parseInt(number.substring(i,i+1));
		}

		a = total%11;


		if (a==0 || a==1)
		{
			result = a%10;
		}
		else
			result = 11-a;

		if (result == Integer.parseInt(number.substring(13)))
		{
			System.out.println("유효한 주민번호");

			if (Integer.parseInt(number.substring(0,1)) != 0)
			{
				int userNumber = 19000000 + Integer.parseInt(number.substring(0,6));
				System.out.println(userNumber);

				int userY = userNumber / 10000 ;
				int userM = (userNumber % userY) / 100 ; 
				int userD = (userNumber % userY) % 100;

				System.out.println(userY);
				System.out.println(userM);
				System.out.println(userD);

				Calendar cal = Calendar.getInstance();

				cal.set(userY, userM-1, userD);

				cal.add(userY, 20);

				System.out.printf("%tF", cal);
			}

		}
		else
			System.out.println("잘못된 주민번호");
	}
}

19970811