/*==================================
  ■■■ 컬렉션 (Collection) ■■■
===================================*/

// List → String[] : List.toArray()

// String[] → List : Arrays.asList();

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

public class Test167
{
	public static void main(String[] args)
	{
		List<String> mList = new ArrayList<String>();

		mList.add("1");
		mList.add("2");
		mList.add("3");

		// check~!!!
		// List → String[]
		// mList.toArray(new String[3]); 
		String[] strArray = mList.toArray(new String[mList.size()]);

		for (String s : strArray )
		{
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>> 1 2 3

		// check~!!!
		// String[] → List
		// Arrays.asList();
		List<String> mNewList = Arrays.asList(strArray);					//asList는 클래스 메소드
		// ※ 『Arrays.asList()』의 반환 자료형은 『List』

		for (String s : mNewList )
		{
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>>  1 2 3
	}
}

