/*==================================
	HelloController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class HelloController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		String message = "Hello, SpringMVC World~!!!";
		
		// request.setAttribute 와 같은 구문
		mav.addObject("message", message);
		//  =========  =======   =======
		//  ModelAndView에 객체를 추가 / "message"라는 이름으로 / message에 담긴 값을
		mav.setViewName("/WEB-INF/view/Hello.jsp");				
		
		return mav;
		
	}

}
