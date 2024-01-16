/*==============================================
	Main.java
	- 클래스.
	- main() 메소드를 포함하는 테스트 클래스.
===============================================*/

package com.test.spr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
	public static void main(String[] args)
	{	
		// [스프링이 처리하고 관리하게 될 영역]
		// → 즉, 스프링 컨테이너 안에서 벌어지게 될 상황
		// ---------------------------------------------------------------------------
		/*
		// ① RecordImpl1(Record) 객체 생성 과정
		//RecordImpl1 rec1 = new RecordImpl1();
		Record rec1 = new RecordImpl1();			//-- dependency (의존 객체)
		
		// ② RecordImpl2(Record) 객체 생성 과정
		//RecordImpl2 rec2 = new RecordImpl2();
		Record rec2 = new RecordImpl2();			//-- dependency (의존 객체)
		
		// RecordViewImpl1 객체 생성 과정
		//-- Record(의존 객체 → RecordImpl1) 객체 필요
		//RecordViewImpl view = new RecordViewImpl();
		RecordView view = new RecordViewImpl();
		
		// check~!!!
		// 의존 객체 주입
		//-- 의존 객체 주입 방법을 사용하게 되면
		//   느슨한 결합을 구성할 수 있게 되고
		//   한 쪽의 변동 상황이 다른 쪽에 영향을 덜 줄 수 있게 된다.
		view.setRecord(rec2); 							//-- setter injection
														//   (setter 를 통한 주입)		
		*/
		// ---------------------------------------------------------------------------
		
		
		// ※ 스프링 프레임워크에서는
		//    객체 생성 과정 및 DI(의존객체 주입)에 대한 설정은
		//    스프링 환경 설정 파일로 대체된다. (→ applicationContext.xml)
		
		// 스프링 프레임워크에게...
		// 『applicationContext.xml』 파일을 읽어서
		// 생성 및 관리할 객체에 대한 정보를 얻을 수 있도록 해야 한다.
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		// 『getBean()』 메소드를 이용하여 사용자가 원하는 객체를 얻어낸다.
		// 메소드의 인자값으로 식별자(id)를 통해 구분하여 지정하게 된다.
		//RecordView view = (RecordView)context.getBean("view");
		
		// 스프링 3.0 이후 버전부터 사용 가능한 코드
		RecordView view = context.getBean("view", RecordViewImpl.class);
		
		view.input();
		view.output();
		
	}

}
