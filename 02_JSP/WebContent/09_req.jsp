<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청(redirect관련)</title>
</head>
<body>
	<h2>요청(redirect) - 09_req.jsp</h2>
	<form action="09_resp_redirect.jsp">
		<select name="site">
			<option value="naver">네이버</option>
			<option value="daum">다음</option>
			<option value="google">구글</option>
		</select>
		<input type="submit" value="웹사이트로 이동">
	</form>
</body>
</html>