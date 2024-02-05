/*================================================
	XmlDomTest03.java
	- 콘솔 기반 자바 프로그램
	- XML DOM 활용 → 로컬(local) XML 읽어내기
	  (memList.xml)
================================================*/

// 채다선 010-2694-8958 서울 1996-10-23 여 JAVA ORACLE

package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest03
{
	public static void main(String[] args)
	{
		try
		{
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xmlObj = null;
			
			String url = "memList.xml";
			xmlObj = builder.parse(url);
			
			Element root = xmlObj.getDocumentElement();
			NodeList memberNodeList = root.getElementsByTagName("memberInfo");
			
			for (int i = 0; i < memberNodeList.getLength(); i++)
			{
				Node memberNode = memberNodeList.item(i);
				Element memberElement = (Element)memberNode;
				
				System.out.printf("%s %s %s %s %s "
								 , getText(memberElement, "name")
								 , getText(memberElement, "telephone")
								 , getText(memberElement, "addr")
								 , getText(memberElement, "birth")
								 , getText(memberElement, "gender"));
				
				NodeList curriculumnNodeList = memberElement.getElementsByTagName("curriculumn");
				if (curriculumnNodeList.getLength() > 0)
				{
					Node curriculumnNode = curriculumnNodeList.item(0);
					Element curriculumnElement = (Element)curriculumnNode;
					
					NodeList subNodeList = curriculumnElement.getElementsByTagName("sub");
					for (int j = 0; j < subNodeList.getLength(); j++)
					{
						Node subNode = subNodeList.item(j);
						Element subElement = (Element)subNode;
						System.out.printf("%s ", subElement.getTextContent());						
					}
					System.out.println();
				}
				else
					System.out.println();
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}		
	}
	
	private static String getText(Element parent, String tagName)
	{
		String result = "";
		
		Node node = parent.getElementsByTagName(tagName).item(0);
		Element element = (Element)node;
		
		result = element.getChildNodes().item(0).getNodeValue();
		
		return result;
	}

}
