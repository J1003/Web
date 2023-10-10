<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL02_redirect.jsp</title>
</head>
<body>
param : ${param }
	
	<h1>[ JSTL02_redirect.jsp ]</h1>
	<h2>ID : ${param.id }</h2>
	
	<c:redirect url="JSTL02_resp.jsp">
		<c:param name="id">${param.id }</c:param>
		<c:param name="name" value="홍길동" />
	</c:redirect>
	
</body>
</html>