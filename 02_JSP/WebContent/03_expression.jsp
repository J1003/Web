<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식(expression)</title>
</head>
<body>
	<h1>표현식(expression)</h1>
	<p>HTML 문을 사용해서 클라이언트(사용자)에게 전달</p>
	<hr>
	<% out.print("<h2>out 객체를 사용해서 클라이언트에게 전달</h2>"); %>
	<h2><% out.print("out 객체를 사용해서 클라이언트에게 전달"); %></h2>
	
	<hr>
	<h2>표현식(expression) 사용해서 클라이언트에게 전달</h2>
	<h3><%="표현식 사용해서 클라이언트에게 전달" %></h3>
	<hr><hr>
	
	<h2>int 변수 2개(num1, num2)의 값을 표현식 사용해서 합계(sum) 화면 출력</h2>
<%
	int num1 = 100;
	int num2 = 200;
	int sum = num1 + num2;
%>	
	<h3>출력형태 : 100 + 200 = 300</h3>
	<h3>표현식1 : <%=num1 %> + <%=num2 %> = <%=sum %></h3>
	<h3>표현식2 : <%=num1 +" + " + num2 +" = " + sum %></h3>
	<br>
	
	<h3>out 객체 이용하는 방법</h3>
	<h3>out : <%out.print(num1 + " + " + num2 +" = " + sum); %></h3>
</body>
</html>