<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두번째(second)</title>
</head>
<body>
<%
	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h1>[ ex02_second.jsp ]</h1>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>	
	<hr>

<%
	//파라미터 값 추출
	String name2 = request.getParameter("name2");
	String age2 = request.getParameter("age2");
%>
	<h2>forward에서 추가된 파라미터 값</h2>
	<h2>이름2 : <%=name2 %></h2>
	<h2>나이2 : <%=age2 %></h2>	
</body>
</html>
