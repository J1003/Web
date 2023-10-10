<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL format</title>
</head>
<body>
	<h1>데이터 포맷 지정</h1>
	<h2>formatNumber : 숫자 출력 형식 지정 #,###.## / 0,000.00</h2>
	<fmt:formatNumber value="123456789.678" pattern="#,###.##" /><br>
	<fmt:formatNumber value="123456789.678" pattern="0,000.00" />
	<hr>
	
	<fmt:formatNumber value="1" pattern="#,###.##" /><br>
	<fmt:formatNumber value="1" pattern="0,000.00" /><br>
	<fmt:formatNumber value="0" pattern="#,###.##" /><br>
	<fmt:formatNumber value="0" pattern="0,000.00" /><br>
	
	<fmt:formatNumber value="1" pattern="#,###.00" /><br>
	<hr><hr>
	
	<h2>formatDate : 날짜 출력 형식 </h2>
<%
	Date now = new Date();
	pageContext.setAttribute("now", now);
%>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /><br>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /><br>
	<fmt:formatDate value="${now }" pattern="yyyy/MM/dd HH:mm:ss" /><br>
	<fmt:formatDate value="${now }" pattern="yyyy.MM.dd HH:mm:ss" />
	
</body>
</html>