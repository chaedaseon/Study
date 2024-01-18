/*==================================
	DepartmentListController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class DepartmentListController implements Controller
{
	private DepartmentDAO dao;
	
	public void setDao(DepartmentDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 추가
		HttpSession session = request.getSession();
		if (session.getAttribute("name")==null)				// 로그인을 하지 않은 경우 → 로그인 페이지로 이동
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)		// 로그인을 했지만 관리자가 아닌 경우 로그인 페이지로 이동
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		ArrayList<Department> departmentList = new ArrayList<Department>();
		
		try
		{
			
			departmentList = dao.list();
			
			mav.addObject("departmentList", departmentList);
			mav.setViewName("/WEB-INF/view/DepartmentList.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}

}
