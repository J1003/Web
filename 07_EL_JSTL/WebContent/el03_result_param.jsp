<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL param</title>
</head>
<body>
param : ${param }<br>
paramValues : ${paramValues }

	<h2>EL 사용해서 전달받은 데이터 표시(param, paramValues)</h2>
	<p>아이디(\${param.id }) : ${param.id }</p>
	<p>암호 : ${param.pwd }</p>
	<p>이름 : ${param.name }</p>
	<p>성별 : ${param.gender }</p>
	<p>취미(\${param.hobby }) : ${param.hobby }</p>
	
	<p>취미(배열객체 \${paramValues.hobby }) : ${paramValues.hobby }</p>
	<p>취미(배열데이터 사용) : 
		${paramValues.hobby[0] }
		${paramValues.hobby[1] }
		${paramValues.hobby[2] }
		${paramValues.hobby[3] }
	</p>

</body>
</html>