/*==================================
  ■■■ 컬렉션 (Collection) ■■■
===================================*/
//★★★★★★★★★★★★★★★Test162 중요!!!★★★★★★★★★★★★★★★★★★★★★★★★★★★
// 자료구조 객체 선언 및 생성 시
// 사용자 정의 클래스 활용
// → 자료형

import java.util.Vector;

// 클래스 → 사용자 정의 자료형으로 활용
class MyData
{
	// 주요 속성 구성 → 주요 변수 선언(멤버 변수)
	private String name;		//-- 이름
	private int age;			//-- 나이

	// getter → getXxx()
	// setter → SetXxx()

	// getter → setter 구성
	public String getName()
	{
		return name;
	}

	public void setName(String name)			// 값을 집어넣는 것이기 때문에 이 자리에서 반환할게 없음
	{
		this.name = name;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	// 생성자 → 사용자 정의 생성자(매개변수 2개인 생성자)
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}

	// ※ 사용자 정의 생성자가 구성될 경우
	//	  default 생성자가 자동으로 삽입되지 않기 때문에
	//	  defautl 생성자 형태의 생성자를 사용자 정의 생성자로
	//	  추가 구성하게 되는 것이 일반적인 클래스 설계 과정
	//	  (반드시 설계해야 한다는 문법적인 규칙은 없다.)

	// 생성자 → 사용자 정의 생성자(매개변수 없는 생성자)
	public MyData()
	{
		//this("", 0);		// 아래 2줄이랑 같은 코드
		name = "";
		age = 0;
	}
	
	/*
	@Override
	public String toString()
	{	
		return "이름:" + name + ", " + "나이:" + age + "세";
	}
	*/
}

public class Test162
{
	public static void main(String[] args)
	{
		// 벡터 자료구조 생성
		Vector<MyData> v = new Vector<MyData>();			// MyData 타입만 요소로 취할 수 있는 벡터

		// 벡터 자료구조 v 에
		// 김수환 73세 / 김지민 7세 / 노은하 3세
		// 담아내기

		// ①
		/*
		MyData st1 = new MyData();
		st1.setName("김수환");
		st1.setAge(74);
		v.add(st1);

		MyData st2 = new MyData();
		st2.setName("김지민");
		st2.setAge(7);
		v.add(st2);

		MyData st3 = new MyData();
		st3.setName("노은하");
		st3.setAge(3);
		v.add(st3);
		*/

		// ②
		/*
		MyData st1 = new MyData("김수환", 73);
		v.add(st1);
		MyData st2 = new MyData("김지민", 7);
		v.add(st2);
		MyData st3 = new MyData("노은하", 3);
		v.add(st3);
		*/

		// ③
		v.add(new MyData("김수환", 73));			// 벡터에 add 해주니까 접근할 수 있는 방법이 생김, 그래서 MyData st1 = new MyData("김수환", 73);  v.add(st1);이렇게 사용하지 않고 바로 넣어줘도 된다.
		v.add(new MyData("김지민", 7));
		v.add(new MyData("노은하", 3));

		// 벡터 자료구조 v 에 담긴 내용(요소) 전체 출력하기
		// 실행 예)
		// 이름:김수환, 나이:73세
		// 이름:김지민, 나이:7세
		// 이름:노은하, 나이:3세

		// ① 
		for (MyData obj : v)
		{
			System.out.printf("이름:%s, 나이:%d세\n", obj.getName(), obj.getAge());
		}
		System.out.println();
		//--==>> 이름:김수환, 나이:73세
		//		 이름:김지민, 나이:7세
		//		 이름:노은하, 나이:3세

		// ②
		for (int i=0; i<v.size(); i++)
		{
			System.out.printf("이름:%s, 나이:%d세\n", v.elementAt(i).getName(), v.elementAt(i).getAge());
		}
		System.out.println();
		//--==>> 이름:김수환, 나이:73세
		//		 이름:김지민, 나이:7세
		//		 이름:노은하, 나이:3세

		// ③	
		for (int i=0; i<v.size(); i++)
		{
			System.out.printf("이름:%s, 나이:%d세\n", v.get(i).getName(), v.get(i).getAge());
		}
		System.out.println();
		//--==>> 이름:김수환, 나이:73세
		//		 이름:김지민, 나이:7세
		//		 이름:노은하, 나이:3세

		// ④
		for (Object obj : v)
		{
			System.out.printf("이름:%s, 나이:%d세\n", ((MyData)obj).getName(), ((MyData)obj).getAge());				//obj를 MyData로 다운캐스팅
		}
		System.out.println();
		//--==>> 이름:김수환, 나이:73세
		//		 이름:김지민, 나이:7세
		//		 이름:노은하, 나이:3세





		/*
		for (MyData data : v)
			System.out.println(data);
		*/
		/*
		for (int i=0 ;i<v.size() ;i++ )
			System.out.println("이름:" + v.get(i).getName() + "," + "나이:" + v.get(i).getAge() + "세");
		*/

	}
}
