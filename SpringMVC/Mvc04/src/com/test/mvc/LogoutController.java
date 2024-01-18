/*============================================================================================
	#36. LogoutController.java
	- 사용자 정의 컨트롤러 클래스
	- 로그아웃 액션 처리 전용 객체.
	- 세션에 구성된 속성값을 제거.
	- 액션 처리 이후
	  다시 로그인 폼(loginform.action)을 요청할 수 있도록 안내
============================================================================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class LogoutController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// 세션에 구성된 속성값들 제거
		HttpSession session =  request.getSession();
		
		session.removeAttribute("name");
		session.removeAttribute("admin");
		
		// 로그아웃 뷰 페이지(→ 안전하게 로그아웃 처리되었음
		//                       → 로그인 페이지로 돌아가기)
		// 없이...
		// 바로 로그인 페이지를 다시 요청할 수 있도록 안내
		mav.setViewName("redirect:loginform.action");				
		
		return mav;
		
	}

}
