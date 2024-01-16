/*==============================================
	MemberProcess.java
	- 콘솔 기반 서브 메뉴 입출력 전용 클래스
==============================================*/

package com.test;

import java.util.ArrayList;
import java.util.Scanner;

public class MemberProcess
{
	private MemberDAO dao;
	
	public MemberProcess()
	{
		dao = new MemberDAO();
	}
			
	// 직원 정보 입력
	public void memberInsert()
	{
		try
		{
			dao.connection();
			
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.println("직원 정보 입력 ------------------------------------------------------------");
			System.out.print("이름 : ");
			String name = sc.next();
			
			if (name.equals("."))
				return;
			
			System.out.print("주민등록번호(yymmdd-nnnnnnn) : ");
			String ssn = sc.next();
			
			System.out.print("입사일(yyyy-mm-dd) : ");
			String ibsa = sc.next();
			
			System.out.print("지역(" );
			for (MemberDTO dto : dao.city())
				System.out.printf("%s/", dto.getCityname());
			System.out.print(") : ");
			String city = sc.next();
			
			System.out.print("전화번호 : ");
			String tel = sc.next();
			
			System.out.print("부서(" );
			for (MemberDTO dto : dao.buseo())
				System.out.printf("%s/", dto.getBuseoname());
			System.out.print(") : ");
			String buseo = sc.next();
			
			System.out.print("직위(" );
			for (MemberDTO dto : dao.jikwi())
				System.out.printf("%s/", dto.getJikwiname());
			System.out.print(") : ");
			String jikwi = sc.next();

			System.out.printf("기본급(최소 %s 이상) : ", dao.minpay(jikwi));
			int basicpay = sc.nextInt();
			
			System.out.print("수당 : ");
			int sudang = sc.nextInt();
			
			MemberDTO dto = new MemberDTO();
			dto.setEmpname(name);
			dto.setSsn(ssn);
			dto.setIbsadate(ibsa);
			dto.setCityid(dao.convert(1, city));
			dto.setTel(tel);
			dto.setBuseoid(dao.convert(2, buseo));
			dto.setJikwiid(dao.convert(3, jikwi));
			dto.setBasicpay(basicpay);
			dto.setSudang(sudang);
			dto.setPay(basicpay+sudang);
			
			int result = dao.add(dto);
			if (result > 0)
			{
				System.out.println("\n입력이 완료되었습니다.");
			}
			
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
	}
	
	// 직원 전체 출력 - 사번 정렬  - 이름 정렬 - 부서 정렬  - 직위 정렬  - 급여 내림차순 정렬
	public void memberSelect()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{			
			System.out.println("");
			System.out.println("1. 사번 정렬");
			System.out.println("2. 이름 정렬");
			System.out.println("3. 부서 정렬");
			System.out.println("4. 직위 정렬");
			System.out.println("5. 급여 내림차순 정렬");
			System.out.print(">> 선택(1~5, -1종료) : ");
			
			int num = sc.nextInt();
			
			dao.connection();
			
			switch (num)
			{
			case 1:
				dao.lists(num);
				break;
			case 2:
				dao.lists(num);
				break;
			case 3:
				dao.lists(num);
				break;
			case 4:
				dao.lists(num);
				break;
			case 5:
				dao.lists(num);
				break;
			case -1:
				break;
			}
			
			int count = dao.count();
			
			System.out.println();
			System.out.printf("전체 인원 : %d명\n", count);
			
			System.out.println("사번  이름    주민번호       입사일   지역     전화번호   부서  직위  기본급   수당   급여");
			for (MemberDTO dto : dao.lists(num))
			{						
	            System.out.printf("%4s %3s %14s %10s %s %13s %s %s %8d %d %7d\n"
					, dto.getEmpid(), dto.getEmpname(), dto.getSsn(), dto.getIbsadate()
					, dto.getCityname(), dto.getTel(), dto.getBuseoname(), dto.getJikwiname()
					, dto.getBasicpay(), dto.getSudang(), dto.getPay());
			}
			System.out.println();
			
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
	}
	
	// 직원 검색 출력 - 사번 검색  - 이름 검색 - 부서 검색  - 직위 검색
	public void memberSearch()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			dao.connection();
			
			System.out.println("");
			System.out.println("1. 사번 검색");
			System.out.println("2. 이름 검색");
			System.out.println("3. 부서 검색");
			System.out.println("4. 직위 검색");
			System.out.print(">> 선택(1~4, -1종료) : ");
			
			int num = sc.nextInt();
			String search = "";
			
			
			ArrayList<MemberDTO> arrayList;
			
			switch (num)
			{
			case 1:
				System.out.println();
				System.out.print("검색할 번호 입력 : ");
				search = sc.next();
				arrayList = dao.lists(num, search);
				
				if (arrayList.size() > 0)
				{
					System.out.println();
					System.out.println("사번  이름    주민번호       입사일   지역     전화번호   부서  직위  기본급   수당   급여");
					
					for (MemberDTO dto : arrayList)
					{
						System.out.printf("%4s %3s %14s %10s %s %13s %s %s %8d %d %7d\n"
								, dto.getEmpid(), dto.getEmpname(), dto.getSsn(), dto.getIbsadate()
								, dto.getCityname(), dto.getTel(), dto.getBuseoname(), dto.getJikwiname()
								, dto.getBasicpay(), dto.getSudang(), dto.getPay());
						System.out.println();
					}
					System.out.println();
				}
				else
				{
					System.out.println("검색한 번호가 존재하지 않습니다.");
				}
				
				break;
			case 2:
				System.out.println();
				System.out.print("검색할 이름 입력 : ");
				search = sc.next();
				arrayList = dao.lists(num, search);
				
							
				if (arrayList.size() > 0)
				{
					System.out.println();
					System.out.println("사번  이름    주민번호       입사일   지역     전화번호   부서  직위  기본급   수당   급여");
					
					for (MemberDTO dto : arrayList)
					{
						System.out.printf("%4s %3s %14s %10s %s %13s %s %s %8d %d %7d\n"
								, dto.getEmpid(), dto.getEmpname(), dto.getSsn(), dto.getIbsadate()
								, dto.getCityname(), dto.getTel(), dto.getBuseoname(), dto.getJikwiname()
								, dto.getBasicpay(), dto.getSudang(), dto.getPay());
						System.out.println();
					}	
					System.out.println();
				}
				else
				{
					System.out.println("검색한 이름이 존재하지 않습니다.");
				}
				
				break;
				
			case 3:
				System.out.println();
				System.out.print("검색할 부서 입력 : ");
				search = sc.next();
				arrayList = dao.lists(num, search);
				
				if (arrayList.size() > 0)
				{
					System.out.println();
					System.out.println("사번  이름    주민번호       입사일   지역     전화번호   부서  직위  기본급   수당   급여");
					
					for (MemberDTO dto : arrayList)
					{
						System.out.printf("%4s %3s %14s %10s %s %13s %s %s %8d %d %7d\n"
								, dto.getEmpid(), dto.getEmpname(), dto.getSsn(), dto.getIbsadate()
								, dto.getCityname(), dto.getTel(), dto.getBuseoname(), dto.getJikwiname()
								, dto.getBasicpay(), dto.getSudang(), dto.getPay());
						System.out.println();
					}	
					System.out.println();
				}
				else
				{
					System.out.println("검색한 부서가 존재하지 않습니다.");
				}				
				break;
				
			case 4:
				System.out.println();
				System.out.print("검색할 직위 입력 : ");
				search = sc.next();
				arrayList = dao.lists(num, search);
				
				if (arrayList.size() > 0)
				{
					System.out.println();
					System.out.println("사번  이름    주민번호       입사일   지역     전화번호   부서  직위  기본급   수당   급여");
					
					for (MemberDTO dto : arrayList)
					{
						System.out.printf("%4s %3s %14s %10s %s %13s %s %s %8d %d %7d\n"
								, dto.getEmpid(), dto.getEmpname(), dto.getSsn(), dto.getIbsadate()
								, dto.getCityname(), dto.getTel(), dto.getBuseoname(), dto.getJikwiname()
								, dto.getBasicpay(), dto.getSudang(), dto.getPay());
						System.out.println();
					}
				}
				else
				{
					System.out.println("검색한 직위가 존재하지 않습니다.");
				}				
				break;
			}
			
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
	}
	
	// 직원 정보 수정
	public void memberUpdate()
	{		
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.print("수정할 번호 입력 : ");
			String id = sc.next();
			
			dao.connection();
			
			ArrayList<MemberDTO> arrayList = dao.lists(1, id);
			
			if (arrayList.size() > 0)
			{
				System.out.println("사번  이름    주민번호       입사일   지역     전화번호   부서  직위  기본급   수당   급여");
				for (MemberDTO dto : arrayList)
				{		
					
					System.out.printf("%4s %3s %14s %10s %s %13s %s %s %8d %d %7d\n"
							, dto.getEmpid(), dto.getEmpname(), dto.getSsn(), dto.getIbsadate()
							, dto.getCityname(), dto.getTel(), dto.getBuseoname(), dto.getJikwiname()
							, dto.getBasicpay(), dto.getSudang(), dto.getPay());
				}
				System.out.println();
				
				System.out.println();
				System.out.print("수정할 데이터 입력(이름 주민번호 입사일 지역 전화번호 부서 직위 기본급 수당) : ");
				String name = sc.next();
				String ssn = sc.next();
				String ibsa = sc.next();
				String city = sc.next();
				String tel = sc.next();
				String buseo = sc.next();
				String jikwi = sc.next();
				int basicpay = sc.nextInt();
				int sudang = sc.nextInt();
				
				
				MemberDTO dto = new MemberDTO();
				dto.setEmpname(name);
				dto.setSsn(ssn);
				dto.setIbsadate(ibsa);
				dto.setCityname(city);
				dto.setTel(tel);
				dto.setBuseoname(buseo);
				dto.setJikwiname(jikwi);
				dto.setBasicpay(basicpay);
				dto.setSudang(sudang);
				dto.setPay(basicpay+sudang);
				
				int result = dao.modify(dto);
				if (result > 0)
				{
					System.out.println("수정이 완료되었습니다.");
				}				
			}
			else
			{
				System.out.println("수정할 번호가 존재하지 않습니다.");
			}
			
			
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
	}
	
	// 직원 정보 삭제
	public void memberDelete()
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.print("삭제할 번호 입력 : ");
			String id = sc.next();
			
			dao.connection();
			
			ArrayList<MemberDTO> arrayList = dao.lists(1, id);
			
			if (arrayList.size() > 0)
			{
				System.out.println("사번  이름    주민번호       입사일   지역     전화번호   부서  직위  기본급   수당   급여");
				
				for (MemberDTO dto : arrayList)
				{					
					System.out.printf("%4s %3s %14s %10s %s %13s %s %s %8d %d %7d\n"
							, dto.getEmpid(), dto.getEmpname(), dto.getSsn(), dto.getIbsadate()
							, dto.getCityname(), dto.getTel(), dto.getBuseoname(), dto.getJikwiname()
							, dto.getBasicpay(), dto.getSudang(), dto.getPay());
				}
				System.out.println();
				
				System.out.println();
				System.out.print("정말 삭제하시겠습니까?(Y/N) : ");
				String response = sc.next();
				
				if (response.equals("Y")||response.equals("y"))
				{
					int result = dao.remove(id);
					if (result > 0)
						System.out.println();
						System.out.println("삭제가 완료되었습니다.");					
				} else
				{
					System.out.println("취소되었습니다.");
				}				
			}			
			
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
	}	
}
