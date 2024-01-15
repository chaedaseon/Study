/**
 * myMenu.js
 */

/*
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/

function myMenu(status)
{
	// 확인
	//alert("함수 호출");
	
	//alert(status);
	
	var menu = document.getElementById("menuTable");
	
	if (status==1)
	{
		// 확인
		//alert("1번 확인");
		
		// 스타일 제어
		menu.style.display = "block";
	}
	else
	{
		// 확인
		//alert("2번 확인");
		

		// 스타일 제어
		menu.style.display = "none";
	}
} 



