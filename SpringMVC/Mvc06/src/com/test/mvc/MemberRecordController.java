/*=======================================================================
	MemberRecordController.java
	- 사용자 정의 컨트롤러 클래스
	
	- 데이터베이스의 리스트를 읽어오는 액션 처리
	- 『memberlist.action』 → 요청 → memberList() 처리
	
	- 데이터 입력(회원 등록)폼 요청 관련 액션 처리
	- 『memberinsertform.action』 → 요청 → memberInsertForm() 처리
	
	- 데이터 입력(회원 등록) 액션 처리
	- 『memberinsert.action』 → 요청 → memberInsert() 처리
=======================================================================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberRecordController
{
	// 데이터베이스의 리스트를 읽어오는 액션 처리
	@RequestMapping("/memberlist.action")
	public String memberList(Model model) throws SQLException, ClassNotFoundException
	{		
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connection();
			memberList = dao.lists();			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		model.addAttribute("memberList", memberList);
		
		return "/WEB-INF/view/MemberList.jsp";
	}
	
	// 데이터 입력(회원 등록)폼 요청 관련 액션 처리
	@RequestMapping("/memberinsertform.action")
	public String memberInsertForm()
	{
		return "/WEB-INF/view/MemberInsertForm.jsp";
	}
	
	// 데이터 입력(회원 등록) 액션 처리 ①
	@RequestMapping("/memberinsert.action")
	public String memberInsert(MemberDTO dto) throws ClassNotFoundException, SQLException
	{
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connection();
			dao.insertQuery(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
				
		return "redirect:memberlist.action";
	}
	
	/*
	// 데이터 입력(회원 등록) 액션 처리 ②
	@RequestMapping("/memberinsert.action")
	public String insert(@RequestParam("id") String id, @RequestParam("pw") String pw, @RequestParam("name") String name, @RequestParam("tel") String tel, @RequestParam("email") String email) throws ClassNotFoundException, SQLException
	{
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connection();
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setTel(tel);
			dto.setEmail(email);
			
			dao.insertQuery(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}		
		
		return "redirect:memberlist.action";
	}
	*/

}
