/*=======================
	GradeController.java
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
public class GradeController
{
	// 주요 속성 구성
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	// 성적정보 리스트 출력 기능 처리
	@RequestMapping(value="/gradelist.action", method=RequestMethod.GET)
	public String gradeList(ModelMap model)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		model.addAttribute("list", dao.list());
		
		return "/WEB-INF/view/GradeList.jsp";
	}
	
	// 성적정보 입력폼 기능 처리
	@RequestMapping(value="/gradeinsertform.action", method=RequestMethod.GET)
	public String gradeInsertForm(String sid, String name, ModelMap model)
	{	
		model.addAttribute("sid", sid);
		model.addAttribute("name", name);
		
		return "/WEB-INF/view/GradeInsertForm.jsp";
	}
	
	// 성적정보 입력 기능 처리
	@RequestMapping(value="/gradeinsert.action", method=RequestMethod.POST)
	public String gradeInsert(GradeDTO dto)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.add(dto);
		
		return "redirect:gradelist.action";
	}
	
	// 성적정보 삭제 기능 처리
	@RequestMapping(value="/gradedelete.action", method=RequestMethod.GET)
	public String gradeDelete(String sid)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.remove(sid);
		
		return "redirect:gradelist.action";
	}
	
	// 성적정보 수정폼 기능 처리
	@RequestMapping(value="/gradeupdateform.action", method=RequestMethod.GET)
	public String gradeUpdateForm(String sid, ModelMap model)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		model.addAttribute("search", dao.searchId(sid));
		
		return "/WEB-INF/view/GradeUpdateForm.jsp";
	}
	
	// 성적정보 수정 기능 처리
	@RequestMapping(value="/gradeupdate.action", method=RequestMethod.POST)
	public String gradeUpdate(GradeDTO dto)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.modify(dto);
				
		return "redirect:gradelist.action";
	}
	
	

}
