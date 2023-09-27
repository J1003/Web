<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부 전역변수</title>
</head>
<body>
<%!
	// 선언부(declaration)는 필드영역에 작성되는 코드!
	int globalNum = 0;
%>
<%	
	// 스크립트릿 - service() 메소드 영역(로컬영역)
	int localNum = 0; //지역변수
	localNum++;	// 서비스메소드(service()) 내에 작성된 코드라 계속 같은 값으로 출력됨
	globalNum++; // globalNum은 새로고침 할 때마다 계속 증가하는 값으로 출력됨
	
	// 콘솔창에 출력
	System.out.println("globalNum : " + globalNum);
	System.out.println("localNum : " + localNum);
%>
	<h1>선언부/크립트릿 변수값 확인(브라우저 화면에 출력)</h1>
	<h2>globalNum : <%=globalNum %></h2>
	<h2>localNum : <%=localNum %></h2>
</body>
</html>