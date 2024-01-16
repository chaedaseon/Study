/*==============================================
  ■■■ 예외 처리 (Excptoin Handling) ■■■
==============================================*/

// Test150.java 파일과 비교~!!!

// ※ throw

class Demo
{
	private int value;

	public void setValue(int value) throws Exception
	{
		if (value<=0)
		{
			//return;
			throw new Exception("value 는 0보다 작거나 같을 수 없습니다.");			// new라는 연산자를 통해서 exception 객체 생성
			//-- 예외 발생~!!!
		}
		

		this.value = value;
	}

	public int getValue()
	{
		return value;
	}
}



public class Test151
{
	public static void main(String[] args) //throws Exception				// 예외 처리한 메소드를 불러왔으니 main 에서도 예외 처리 해줘야 함
	{
		Demo ob = new Demo();

		try					// throws Exception 안쓸거면  try~catch로 예외 잡아줘야함
		{
			ob.setValue(-3);
			int result = ob.getValue();
			System.out.println(result);
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}


	}
}

// 실행 결과

/*
java.lang.Exception: value 는 0보다 작거나 같을 수 없습니다.
계속하려면 아무 키나 누르십시오 . . .
*/