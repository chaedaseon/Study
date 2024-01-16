/*=============================================
	Main.java
	- main() 메소드를 포함하는 테스트 클래스
==============================================*/

package com.test.spr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
	public static void main(String[] args)
	{
		//MemberList member = new MemberList();
		//-- 객체 생성 과정을 스프링이 담당하게 되므로
		//   우리가 직접 작성했던 인스턴스 생성구문 삭제~!!!
		
		// 스프링 환경 설정 파일로 만든 『applicationContext.xml』 에서
		// MemberList 클래스 기반의 객체를 얻어올 수 있도록 처리~!!!
		
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		MemberList member = context.getBean("member", MemberList.class);
		
		member.print();
	}
}
