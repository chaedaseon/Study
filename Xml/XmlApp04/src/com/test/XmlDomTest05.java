/*================================================
	XmlDomTest05.java
	- 콘솔 기반 자바 프로그램
	- XML DOM 활용 → 로컬(local) XML 읽어내기
	  (VEHICLE.xml)
================================================*/

/*
-------------------------------------------------------
NO MAKE   MODEL		 YEAR	 STYLE			PRICE
-------------------------------------------------------
1  Dodge  Durango	 1998	 Sport Utility	18000
Options -----------------------------------------------
	Power_Locks : Yes
	Power_Window : Yes
	Stereo : Radio/Cassette/CD
	Air_Conditioning : Yes
	Automatic : Yes
	Four_Wheel_Drive : Full/Partial
	Note : Very clean
-------------------------------------------------------
2  Honda  Civic		 1997	 Sedan			8000
Options -----------------------------------------------
	Power_Locks : Yes
	Power_Window : Yes
	Stereo : Radio/Cassette
	Automatic : Yes
	Note : Like New
-------------------------------------------------------
						  :
*/

package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest05
{
	public static void main(String[] args)
	{
		try
		{
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xmlObj = null;
			
			String url = "VEHICLES.xml";
			xmlObj = builder.parse(url);
			
			Element root = xmlObj.getDocumentElement();
			
			NodeList vehicleNodeList = root.getElementsByTagName("VEHICLE");
			
			System.out.println("-------------------------------------------------------");
			System.out.println("NO	MAKE	MODEL	YEAR	STYLE		PRICE");
			System.out.println("-------------------------------------------------------");
			for (int i = 0; i < vehicleNodeList.getLength(); i++)
			{
				Node vehicleNode = vehicleNodeList.item(i);
				Element vehicleElement = (Element)vehicleNode;
				
				System.out.printf(" %s \t%s %s \t%s \t%s \t%s%n"
								 , getText(vehicleElement, "INVENTORY_NUMBER")
								 , getText(vehicleElement, "MAKE")
								 , getText(vehicleElement, "MODEL")
								 , getText(vehicleElement, "YEAR")
								 , getText(vehicleElement, "STYLE")
								 , getText(vehicleElement, "PRICE"));
				
				NodeList optionsNodeList = vehicleElement.getElementsByTagName("OPTIONS");
				if (optionsNodeList.getLength() > 0)
				{
					Node optionsNode = optionsNodeList.item(0);
					Element optionsElement = (Element)optionsNode;
					System.out.println("Options -----------------------------------------------");
					
					NodeList optionNodeList = optionsElement.getChildNodes();			// check~!!!
					for (int m=0; m<optionNodeList.getLength(); m++)
					{
						Node optionNode = optionNodeList.item(m);
						if (optionNode.getNodeType() == 1)			// ELEMENT_NODE		// check~!!!
						{
							Element optionElement = (Element)optionNode;
							System.out.printf("\t%s : %s%n", optionElement.getNodeName(), optionElement.getTextContent());
						}
					}
				}
				System.out.println("-------------------------------------------------------");
				
			}
			//--==>>
			/*
			-------------------------------------------------------
			NO	MAKE	MODEL	YEAR	STYLE		PRICE
			-------------------------------------------------------
			 1 	Dodge Durango 	1998 	Sport Utility 	18000
			Options -----------------------------------------------
				Power_Locks : Yes
				Power_Window : Yes
				Stereo : Radio/Cassette/CD
				Air_Conditioning : Yes
				Automatic : Yes
				Four_Wheel_Drive : Full/Partial
				Note : Very clean
			-------------------------------------------------------
			 2 	Honda Civic 	1997 	Sedan 	8000
			Options -----------------------------------------------
				Power_Locks : Yes
				Power_Window : Yes
				Stereo : Radio/Cassette
				Automatic : Yes
				Note : Like New
			-------------------------------------------------------
			 3 	Dodge Neon 	1996 	Sedan 	7000
			Options -----------------------------------------------
				Stereo : Radio/Cassette
				Automatic : Yes
				Note : Need minor body works
			-------------------------------------------------------
			 4 	Ferrari F355 	1995 	Sport 	45000
			Options -----------------------------------------------
				Power_Locks : Yes
				Power_Window : Yes
				Stereo : Radio/Cassette/CD
				Air_Conditioning : Yes
				Note : Luxury car
			-------------------------------------------------------
			 5 	BMW 3 Series 	1998 	Sedan 	40000
			Options -----------------------------------------------
				Power_Locks : Yes
				Power_Window : Yes
				Interiors : Leather
				Stereo : Radio/Cassette/CD
				Air_Conditioning : Yes
				Note : Pre-owned
			-------------------------------------------------------
			 6 	BMW Z3 	1998 	Convertible 	33000
			Options -----------------------------------------------
				Cover_Material : Plastic
				Power_Locks : Yes
				Power_Window : Yes
				Alarm : Yes
				Interiors : Fabric
				Stereo : Radio/Cassette/CD
				Air_Conditioning : Yes
				Note : Pre-owned, very clean
			-------------------------------------------------------
			 7 	Dodge RAM 	1997 	Truck 	22000
			Options -----------------------------------------------
				Stereo : Radio
				Max_Load : 1500
				Note : Heavy duty Vehicle
			-------------------------------------------------------
			 8 	Honda Accord 	1995 	Sedan 	8500
			Options -----------------------------------------------
				Power_Locks : Yes
				Stereo : Radio/Cassette
				Automatic : Yes
			-------------------------------------------------------
			 9 	Dodge RAM 2500 	1996 	Truck 	25000
			Options -----------------------------------------------
				Stereo : Radio/Cassette
				Max_Load : 2500
				Note : Heavy duty truck
			-------------------------------------------------------
			 10 	Ford Explorer 	1996 	Sport Utility 	18000
			Options -----------------------------------------------
				Power_Locks : Yes
				Stereo : Radio/Cassette
				Automatic : Yes
				Interiors : Fabric
				Air_Conditioning : Yes
				Note : Pre-owned, very clean
			-------------------------------------------------------
			*/
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}//end main()
	
	
	private static String getText(Element parent, String tagName)
	{
		String result = "";
		
		Node node = parent.getElementsByTagName(tagName).item(0);
		Element element = (Element)node;
		
		result = element.getChildNodes().item(0).getNodeValue();
		
		return result;
	}
}
