<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리를 위한 설정
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 include</title>
</head>
<body>
<%-- JSP 액션태그 : JSP 페이지 흐름제어, 데이터 처리
	사용형태 : <jsp:액션명령></jsp:액션명령>
		또는 <jsp:액션명령 />
--%>
	<h1>디렉티브/액션태그 - include</h1>
	<hr>
	<h2>디렉티브(지시어) - include : 복사 & 붙여넣기(정적)</h2>
	<h3>지시어 include(정적처리) : 포함시킬 내용을 삽입 후 컴파일 처리</h3>
	<%@ include file="ex01_includee.jsp" %>
	<p>----------</p>
	<%@ include file="ex01_includee2.jspf" %>
	<hr><hr>
	
	<h2>액션태그 - jsp:include 사용시엔 *.jsp 사용할 것</h2>
	
	<jsp:include page="ex01_includee.jsp"></jsp:include>
	<p>----------</p>
	<jsp:include page="ex01_includee2.jspf" />
	<hr><hr>
	
	<%--============================= --%>
	<h2>액션태그 - jsp:include(파라미터 값 전달)</h2>
	<h3>액션 include : 실행시 요청 결과를 받아 포함시킴(삽입, 추가)</h3>
	<h3>[주의]액션 include 사용시 request에 UTF-8 설정처리(한글깨짐 방지 처리) </h3>
	<jsp:include page="ex01_includee3_param.jsp">
		<jsp:param value="홍길동" name="name"/>
		<jsp:param value="33" name="age"/>
	</jsp:include>
	
	<hr><hr>
	<%@ include file="ex01_includee3_param.jsp" %>
	
	
	
</body>
</html>