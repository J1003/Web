<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 자바빈(Bean) VO에 저장해서 사용 --%>
	<jsp:useBean id="vo" class="com.mystudy.MemberVO" />
	<jsp:setProperty property="*" name="vo"/>
${vo }
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean 사용</title>
</head>
<body>
	<h1>결과보기(Bean 사용)</h1>
	<ul>
		<li>아이디 : <%=vo.getId() %></li>
	</ul>
	<hr>
	
	<h2>Bean 데이터 EL 사용해서 출력</h2>
	<p>EL은 null 데이터 출력안함</p>
	<ol>
		<li>아이디(\${vo.getId() }) : ${vo.getId() }</li> <%-- 방법1) get메소드 호출 --%>
		<li>아이디(\${vo.id }) : ${vo.id }</li> <%-- 방법2) 필드명 써주면 알아서 get메소드 호출 --%>
		<li>암호 : ${vo.pwd }</li>
		<li>이름 : ${vo.name }</li>
		<li>성별 : ${vo.gender }</li>
		<li>취미(배열) EL : ${vo.getHobby() }</li>
		<li>취미(배열데이터) EL : 
			${vo.hobby[0] }
			${vo.hobby[1] }
			${vo.hobby[2] }
			${vo.hobby[3] }
		</li>
	</ol>
</body>
</html>