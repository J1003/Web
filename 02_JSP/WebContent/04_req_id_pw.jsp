<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청페이지</title>
</head>
<body>
	<h2>(요청) ID, PW 값 서버측으로 전달(04_req_id_pw.jsp)</h2>
	<form action="04_resq_id_pw.jsp">
		<h2>ID : <input type="text" name="id" value="hong"></h2>
		<h2>PW : <input type="password" name="pw" value="pw1234"></h2>
		<input type="submit" value="서버로 전송">
	</form>
</body>
</html>