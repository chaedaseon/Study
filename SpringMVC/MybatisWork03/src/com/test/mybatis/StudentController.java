/*=======================
	StudentController.java
	- 컨트롤러
=======================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StudentController
{
	// 주요 속성 구성
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	// 학생정보 리스트 출력 기능 처리
	@RequestMapping(value="/studentlist.action", method = RequestMethod.GET)
	public String studentList(ModelMap model)
	{				
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("list", dao.list());
		model.addAttribute("count", dao.count());
		
		return "/WEB-INF/view/StudentList.jsp";		
	}
	
	// 학생정보 입력폼 기능 처리
	@RequestMapping(value="/studentinsertform.action", method=RequestMethod.GET)
	public String studentInsertForm(ModelMap model)
	{		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("maxNum", dao.maxNum());
		
		return "/WEB-INF/view/StudentInsertForm.jsp";
	}
	
	// 학생정보 입력 기능 처리
	@RequestMapping(value="/studentinsert.action", method=RequestMethod.POST)
	public String studentInsert(StudentDTO dto)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.add(dto);
		
		return "redirect:studentlist.action";
	}
	
	// 학생정보 수정폼 기능 처리
	@RequestMapping(value="/studentupdateform.action", method=RequestMethod.GET)
	public String studentUpdateForm(String sid, ModelMap model)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("search", dao.searchId(sid));
		
		return "/WEB-INF/view/StudentUpdateForm.jsp";
		
	}
	
	// 학생정보 수정 기능 처리
	@RequestMapping(value="/studentupdate.action", method=RequestMethod.POST)
	public String studentUpdate(StudentDTO dto)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.modify(dto);
		
		return "redirect:studentlist.action";
	}
	
	// 학생정보 삭제 기능 처리
	@RequestMapping(value="/studentdelete.action", method=RequestMethod.GET)
	public String studentDelete(String sid)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.remove(sid);
		
		return "redirect:studentlist.action";
	}
	

}
