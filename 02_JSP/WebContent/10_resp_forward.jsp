<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답(10_resp_forward.jsp)</title>
</head>
<body>
	<h1>응답(10_resp_forward.jsp)</h1>
	<h2>ID : <%=id %></h2>
	<h2>PW : <%=pwd %></h2>
</body>
</html>
<%
	//포워딩 처리(위임/전가 처리)
	RequestDispatcher rd = request.getRequestDispatcher("10_resp_forward-2");
	rd.forward(request, response);
%>