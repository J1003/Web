<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>declaration_선언부</title>
</head>
<body>
		<h2>덧셈</h2>
	<h3>100 + 200 = 300</h3>
<%
	int a = 100; //메소드 내에 선언된 로컬변수(지역변수)
	int b = 200;
	int sum = a + b;
%>	
	<h3><%=a %> + <%=b %> = <%=sum %></h3>
	<hr>
	
	<h2>선언부(declaration) 사용 메소드 선언/사용</h2>
	<h3>sum(a,b) : <%=a %> + <%=b %> = <%=sum(a, b) %></h3>
<%!
	//선언부에 작성된 메소드(필드영역에 작성되는 코드)
	private int sum(int a, int b) {
		return a + b;
	}
%>	
	<hr>
	<h2>선언부(declaration) 사용 변수 선언</h2>
	<h3>tot 출력 : <%=tot %></h3>

<%! 
	// !가 붙으면 필드변수(전역변수)이기 때문에 전체 영역에서 쓸 수 있다. 
	// 원래 변수 선언을 했다 하더라도 이 전에 쓰려고 하면 오류가 난다.
	//선언부 작성된 변수(필드영역에 작성되는 코드)
	int tot = 999; // 필드변수(전역변수)
%>	
	

</body>
</html>