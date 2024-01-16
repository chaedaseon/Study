/*==========================================
  ■■■ 메소드의 재귀 호출 ■■■
  ==========================================*/
public class infRecul
{
	public static void main(String[] args)
	{
		showHi(3);
	}
	
	//showHi() 메소드 코드내에서 두 군데 위치 바꾸기

	public static void showHi(int cnt)
	{	

		showHi(cnt--);
		System.out.println("Hi~~");
		if (cnt==1)
			return;
	

	}
}