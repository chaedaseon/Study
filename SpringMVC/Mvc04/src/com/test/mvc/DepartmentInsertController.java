/*==================================
	DepartmentInsertController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class DepartmentInsertController implements Controller
{
	private IDepartmentDAO dao;
	
	public void setDao(IDepartmentDAO dao)
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
		if (session.getAttribute("name")==null)			// 로그인을 하지 않은 경우 → 로그인 페이지로 이동
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)	// 로그인을 했지만 관리자가 아닌 경우 로그인 페이지로 이동
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		String departmentName = request.getParameter("name");
		
		try
		{
			Department department = new Department();
			
			department.setDepartmentName(departmentName);
			
			dao.add(department);
			
			mav.addObject("department", department);
			mav.setViewName("redirect:departmentlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}		
		
		return mav;
		
	}

}
