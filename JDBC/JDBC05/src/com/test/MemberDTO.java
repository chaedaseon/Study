/*=======================================
	MemberDTO.java
	- 데이터 보관 및 전송 전용 클래스
=======================================*/

package com.test;

public class MemberDTO
{
	// 주요 속성 구성 EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG
	private String empid, empname, ssn, ibsadate;
	private String cityid, tel, buseoid, jikwiid;
	private String cityname, buseoname, jikwiname;
	private int basicpay, sudang, pay;
	
	public String getEmpid()
	{
		return empid;
	}
	public void setEmpid(String empid)
	{
		this.empid = empid;
	}
	public String getEmpname()
	{
		return empname;
	}
	public void setEmpname(String empname)
	{
		this.empname = empname;
	}
	public String getSsn()
	{
		return ssn;
	}
	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}
	public String getIbsadate()
	{
		return ibsadate;
	}
	public void setIbsadate(String ibsadate)
	{
		this.ibsadate = ibsadate;
	}
	public String getCityid()
	{
		return cityid;
	}
	public void setCityid(String cityid)
	{
		this.cityid = cityid;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getBuseoid()
	{
		return buseoid;
	}
	public void setBuseoid(String buseoid)
	{
		this.buseoid = buseoid;
	}
	public String getJikwiid()
	{
		return jikwiid;
	}
	public void setJikwiid(String jikwiid)
	{
		this.jikwiid = jikwiid;
	}
	public int getBasicpay()
	{
		return basicpay;
	}
	public void setBasicpay(int basicpay)
	{
		this.basicpay = basicpay;
	}
	public int getSudang()
	{
		return sudang;
	}
	public void setSudang(int sudang)
	{
		this.sudang = sudang;
	}
	public int getPay()
	{
		return pay;
	}
	public void setPay(int pay)
	{
		this.pay = pay;
	}
	public String getCityname()
	{
		return cityname;
	}
	public void setCityname(String cityname)
	{
		this.cityname = cityname;
	}
	public String getBuseoname()
	{
		return buseoname;
	}
	public void setBuseoname(String buseoname)
	{
		this.buseoname = buseoname;
	}
	public String getJikwiname()
	{
		return jikwiname;
	}
	public void setJikwiname(String jikwiname)
	{
		this.jikwiname = jikwiname;
	}
	
	
	
}
