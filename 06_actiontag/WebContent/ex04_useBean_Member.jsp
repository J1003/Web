<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="ex04_useBean_proc.jsp">
		<fieldset>
		<legend>회원가입</legend>
		<p>이름 : <input type="text" name="name"></p>
		<p>아이디 : <input type="text" name="id"></p>
		<p>암호 : <input type="password" name="pwd"></p>
		<p>암호확인 : <input type="password" name="pwd2"></p>
		<p>이메일 : <input type="email" name="email"></p>
		<p>성별 : 
			<input type="radio" name="gender" value="남">남자
			<input type="radio" name="gender" value="여">여자
		</p>
		<p>취미 :
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
		
		<input type="submit" value="회원가입">
		<input type="reset" value="초기화">
		</fieldset>
	</form>	
	
</body>
</html>