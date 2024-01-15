/**
 * ajax.js
 */

var ajax = null;

// AJAX 객체(→ XMLHttpRequest 객체) 생성 함수
function createAjax()
{
	/*
	// ActiveXObject 를 지원하는 브라우저라면...
	if (window.ActiveXObject)			//-- IE 7 이전
	{
		//return new ActiveXObject("Microsoft.XMLHTTP");
		return new ActiveXObject("Msxml2.XMLHTTP");
		//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		//   (ActiveXObject 객체 → XMLHttpRequest 객체를 대신할 수 있는 객체)
	}
	else								//-- 그 외 브라우저
	{
		if (window.XMLHttpRequest)		//-- XMLHttpRequest 객체 지원 브라우저
		{
			return new XMLHttpRequest();
			//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		}
		else							//-- AJAX 를 지원하지 않는 브라우저
		{
			return null;
			//-- AJAX 사용할 수 없으므로 null 을 반환해라.
		}
	}
	*/
	
	/*
	if (window.ActiveXObject)	
		return new ActiveXObject("Microsoft.XMLHTTP");
	else if (window.XMLHttpRequest)
		return new XMLHttpRequest();
	else
		return null;
	*/
	
	if (window.XMLHttpRequest)
		return new XMLHttpRequest();
	else if (window.ActiveXObject)	
		return new ActiveXObject("Microsoft.XMLHTTP");
	else
		return null;	
		
}