<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터처리(EL)</title>
</head>
<body>
	<h1>데이터처리(EL)</h1>
	<form>
		<fieldset>
		<legend>회원가입</legend>
		<p>아이디 : <input type="text" name="id"></p>
		<p>암호 : <input type="password" name="pwd"></p>
		<p>이름 : <input type="text" name="name"></p>
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
		
		<input type="button" value="전달1(자바빈)" onclick="send_go1(this.form)">
		<input type="button" value="전달2(param)" onclick="send_go2(this.form)">
		</fieldset>
	</form>	

<script>
	function send_go1(frm) {
		frm.action = "el03_result_bean.jsp";
		frm.submit();
	}
	
	function send_go2(frm) {
		frm.action = "el03_result_param.jsp";
		frm.submit();
	}
	
	
</script>
	
</body>
</html>