<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합계구하기</title>
</head>
<body>
	<h1>1부터 10까지의 합계 구하기(02_scriptlet_sum.jsp)</h1>
	<h3>출력형태 : 1+2+3+4+....+9+10=55</h3>
<%
	//1~10까지의 합 구하기
	int sum = 0;
	for (int i = 1; i <= 10; i++) {
		sum += i;
	}
%>	
	<hr>
	<h3>1+2+3+4+....+9+10=<%out.print(sum); %></h3>
	<h3>표현식 : 1+2+3+4+....+9+10=<%=sum %></h3>
</body>
</html>