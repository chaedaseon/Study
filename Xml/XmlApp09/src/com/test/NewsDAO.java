/*======================
	NewsDAO.java
======================*/

package com.test;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class NewsDAO
{
	private Document xmlObj;
	private XPath xPath;
	
	public NewsDAO(String stnId) throws ParserConfigurationException, IOException, SAXException
	{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		String str = String.format("https://www.mk.co.kr/rss/%s/", stnId);
		
		URL url = new URL(str);
		InputSource is = new InputSource(url.openStream());
		xmlObj = builder.parse(is);
		xPath = XPathFactory.newInstance().newXPath();				
	}
	
	public String NewsCategory() throws XPathExpressionException
	{
		String result = "";
		
		result = xPath.compile("rss/channel/title").evaluate(xmlObj);
		
		return result;
		
	}

	
	public ArrayList<String> NewsTitle() throws XPathExpressionException
	{
		ArrayList<String> result = new ArrayList<String>();
		
		NodeList titleNodeList = (NodeList)xPath.compile("/rss/channel/item/title").evaluate(xmlObj, XPathConstants.NODESET);
		
		for (int i=0; i<titleNodeList.getLength(); i++)
		{
			Node titleNode = titleNodeList.item(i);
			result.add(titleNode.getTextContent());
		}
		
		return result;
	}
	
	public ArrayList<NewsDTO> NewsInfo(String idx) throws XPathExpressionException
	{
		ArrayList<NewsDTO> result = new ArrayList<NewsDTO>();
		
		NewsDTO n = new NewsDTO();
		
		String title = xPath.compile(String.format("/rss/channel/item[%s]/title", idx)).evaluate(xmlObj);
		String link = xPath.compile(String.format("/rss/channel/item[%s]/link", idx)).evaluate(xmlObj);
		String category = xPath.compile(String.format("/rss/channel/item[%s]/category", idx)).evaluate(xmlObj);
		String author = xPath.compile(String.format("/rss/channel/item[%s]/author", idx)).evaluate(xmlObj);
		String description = xPath.compile(String.format("/rss/channel/item[%s]/description", idx)).evaluate(xmlObj);
		String pubDate = xPath.compile(String.format("/rss/channel/item[%s]/pubDate", idx)).evaluate(xmlObj);
		
		n.setTitle(title);
		n.setLink(link);
		n.setCategory(category);
		n.setAuthor(author);
		n.setDescription(description);
		n.setPubDate(pubDate);
		
		result.add(n);			
		
		return result;
	}
	
}
