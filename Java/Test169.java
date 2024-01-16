/*==================================
  ■■■ 컬렉션 (Collection) ■■■
===================================*/

// Set → HashSet, TreeSet, ....
// ·순서 없음
// ·중복 허용하지 않는 구조(기본)

/*
○ TreeSet<E> 클래스

   java.util.TreeSet<E> 클래스는
   Set 인터페이스를 상속한 SortedSet 인터페이스를 구현한 클래스로
   데이터를 추가하면 데이터들이 자동으로 오름차순 정렬이 된다.
*/

// VO	- Value Object
// DTO	- Data Transfer Object
// DAO	- Data Access Object

import java.util.TreeSet;
import java.util.Iterator;
import java.util.Comparator;

class GradeVO
{
	// 주요 속성 구성
	private String hak;			//-- 학번
	private String name;		//-- 이름
	private int kor, eng, mat;	//-- 국어, 영어, 수학 점수

	GradeVO(String hak, String name, int kor, int eng, int mat)
	{
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	// 이와 같은 경우 default 생성자 자동 삽입되지 않음~!!!

	// 사용자 정의 생성자 → 매개변수 없는 생성자(default 생성자 형태)
	GradeVO()
	{
		// 생성자 내부에서 또다른 생성자 호출
		//GradeVO("", "", 0, 0, 0);
		//		↓
		this("", "", 0, 0, 0);
	}
	
	// getter /  setter 구성

	String getHak()
	{
		return hak;		
	}

	void setHak()
	{
		this.hak = hak;
	}
	
	String getName()
	{
		return name;
	}

	void setName()
	{
		this.name = name;
	}

	int getKor()
	{
		return kor;
	}

	void setKor()
	{
		this.kor = kor;
	}

	int getEng()
	{
		return eng;
	}

	void setEng()
	{
		this.eng = eng;
	}

	int getMat()
	{
		return mat;
	}

	void setMat()
	{
		this.mat = mat;
	}

	// 추가 메소드 정의(총점 산출)
	public int getTot()
	{
		//return kor + eng + mat;
		return this.kor + this.eng + this.mat;
	}
}

// compare 오버라이딩 하려고 클래스 설계함
class MyComparator<T> implements Comparator<T>				//<T> 어떤 타입(type)을 넘겨주면~  <E> 어떤 엘리먼트(element)를 담으면~
{
	// 비교 메소드 재정의
	@Override
	public int compare(T o1, T o2)
	{
		GradeVO s1 = (GradeVO)o1;
		GradeVO s2 = (GradeVO)o2;

		// 학번 기준(오름차순)
		//return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
		// return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
		// return Integer.parseInt("2308113") - Integer.parseInt("2308116");
		// return 2308113 - 2308116;
		// return -3;
		// → o2가 더 큰 것으로 비교 결과 전달~!!!

		//... return 5;
		// → o1이 더 큰 것으로 비교 결과 전달~!!!

		//... return 0;
		// → o1과 o2가 같은 것으로 비교 결과 전달~!!!

		// 학번 기준 (내림차순)
		//return Integer.parseInt(s2.getHak()) - Integer.parseInt(s1.getHak());

		// 총점 기준 (오름차순)
		//return (s1.getTot() - s2.getTot());

		// 총점 기준 (내림차순)
		//return (s2.getTot() - s1.getTot());

		// 이름 기준 (오름차순)
		//return (s1.getName().compareTo(s2.getName()));

		// 이름 기준 (내림차순)
		return (s2.getName().compareTo(s1.getName()));
		
	}
}



public class Test169
{
	public static void main(String[] args)
	{
		// TreeSet 자료구조 생성
		TreeSet<String> set = new TreeSet<String>();

		// TreeSet 자료구조 set 에 요소 추가 → add();
		set.add("짱구는못말려");
		set.add("슬램덩크");
		set.add("원피스");
		set.add("달빛천사");
		set.add("이누야샤");
		set.add("너의이름은");
		set.add("슈가슈가룬");
		set.add("배틀짱");
		set.add("디지몬");

		// Iterator 를 활용한 Set 요소 전체 출력

		Iterator<String> it = set.iterator();

		while (it.hasNext())
		{
			System.out.print(it.next() + " ");
		}
		System.out.println();
		//--==>> 너의이름은 달빛천사 디지몬 배틀짱 슈가슈가룬 슬램덩크 원피스 이누야샤 짱구는못말려
		//-- 요소를 문자열로 구성할 경우
		//	 가나다순 → 오름차순 정렬

		// TreeSet 자료구조 생성
		//TreeSet<GradeVO> set2 = new TreeSet<GradeVO>();

		TreeSet<GradeVO> set2 = new TreeSet<GradeVO>(new MyComparator<GradeVO>());

		// TreeSet 자료구조 set2에 요소 추가
		set2.add(new GradeVO("2308113", "길현욱", 90, 80, 70));
		set2.add(new GradeVO("2308116", "최혜인", 91, 81, 81));
		set2.add(new GradeVO("2308120", "이윤수", 88, 78, 68));
		set2.add(new GradeVO("2308103", "김다슬", 70, 95, 91));
		set2.add(new GradeVO("2308132", "정현욱", 99, 82, 79));

		// Iterator 를 활용한 set2 요소 전체 출력
		/*
		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{
			System.out.print(it2.next() + " ");
		}
		System.out.println();
		//--==>> 에러 발생(런타임 에러)
		//		 java.lang.ClassCastException: GradeVO cannot be cast to java.lang.Comparable
		*/
		//
		//			↓
		//
		// ※ MyComparator 클래스를 생성하여
		//	  compare() 메소드를 재정의한 후 다시 구성
		/*
		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{
			System.out.print(it2.next() + " ");
		}
		System.out.println();
		*/
		//
		//
		//
		// ※ 객체 자체를 직접 출력하는 것이 아니라
		//	  객체가 갖고있는 속성에 접근하여 출력할 수 있도록 처리
		//
		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{

			// System.out.print(it2.next().getHak() + " " + it2.nexst().getName());		이런식으로 X

			GradeVO vo = it2.next();
			System.out.printf("%7s %7s %4d %4d %4d %5d\n", vo.getHak(), vo.getName(), vo.getKor(), vo.getEng(), vo.getMat(),vo.getTot());
		}
		System.out.println();		
	}
}