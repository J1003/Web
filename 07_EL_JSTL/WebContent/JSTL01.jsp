<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<%--JSTL(JSP Standard Tag Labrary)
	0. 라이브러리 구하기(인터넷)
		다운로드 : https://tomcat.apache.org/download-taglibs.cgi
		다운로드 : https://mvnrepository.com/ > jstl 검색
	1. 라이브러리 등록
		WebContent > WEB-INF > lib > jar 파일 등록
	2. JSTL 디렉티브(지시어) taglib 추가
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
--%>
	<h2>JSTL 사용</h2>
	<h3>속성(변수) 설정 : set</h3>
	<c:set var="test" value="Hello JSTL!!! - page" scope="page" />
	<c:set var="test" value="Hello JSTL!!! - request" scope="request" />
	<c:set var="test" value="Hello JSTL!!! - session" scope="session" />
<%
	//System.out.println("test : " + test); //컴파일 오류
	System.out.println("test : " + pageContext.getAttribute("test"));
	out.print(pageContext.getAttribute("test"));
%>	
	<hr>
	<h3>속성값 출력 : out</h3>
	<p><c:out value="Hello World~~~~" /></p>
	<p>page test(c:out) : <c:out value="${pageScope.test }" /></p>
	<p>page test(EL) : ${pageScope.test }</p>
	<p>session test(EL) : ${sessionScope.test }</p>
	
	<p>application test(EL) : ${applicationScope.test }</p>
	<p>application test(c:out) :
		<c:out value="${applicationScope.test }" default="데이터없음!!!" />
	</p>
	<hr>
	
	<h3>삭제 : remove</h3>
	<c:remove var="test" scope="page"/>
	
	<p>EL(scope 지정 안함) test : ${test }</p>
	<p>page test(EL) : ${pageScope.test }</p>
	<p>request test(EL) : ${requestScope.test }</p>
	<p>session test(EL) : ${sessionScope.test }</p>
	<p>application test(EL) : ${applicationScope.test }</p>
	<hr><hr>
	
	<%-- ====== if문 ========= --%>
	<h2>JSTL에는 if 태그만 있다. else 태그는 없다</h2>
	<h2>JSTL : if 태그 test 속성</h2>
	<c:if test="${10 > 20 }">
		<p>10 &gt; 20 결과 true인 경우 실행문장</p>
	</c:if>
	<c:if test="${10 <= 20 }">
		<p>10 le 20 결과 true인 경우 실행문장</p>
		<%-- le = less than equal --%>
	</c:if>
	<hr>
	
	<h3>JSTL : if 태그2</h3>
	<c:set var="n1" value="30" /><%--주의!!! 문자열 처리됨 --%>
	<c:set var="n2" value="20" />
	
	<%-- 숫자로 비교처리하려면 형변화 후 비교 --%>
	<c:if test="${Integer.parseInt(n1) > Integer.parseInt(n2) }" var="result1">
		<p>if문 결과 ${n1 }이 ${n2 } 보다 큽니다</p>
	</c:if>
	<p>:::: 비교결과1 result1 : ${result1 }</p>
	
	<c:if test="${Integer.parseInt(n1) <= Integer.parseInt(n2) }" var="result2">
		<p>if문 결과 ${n1 }이 ${n2 } 보다 작거나 같습니다</p>
	</c:if>
	<p>:::: 비교결과1 result2 : ${result2 }</p>
	<hr>
	
	<%-- ==== choose ~ when ~ otherwise --%>
	<h2>JSTL : choose ~ when ~ otherwise</h2>
	<p>자바코드의 if~ else if ~ else if ~ else 처럼 동작</p>
	<c:set var="score" value="69"/>
	<c:choose>
		<c:when test="${score >= 90 }">
			<p>판정결과(${score }) : A</p>
		</c:when>
		<c:when test="${score >= 80 }">
			<p>판정결과(${score }) : B</p>
		</c:when>
		<c:when test="${score >= 70 }">
			<p>판정결과(${score }) : C</p>
		</c:when>
		<c:otherwise>
			<p>판정결과(${score }) : 노력필요</p>
		</c:otherwise>
	</c:choose>
	<hr><hr>
	
	<%-- ===== JSTL 반복문 c:forEach ========= --%>
	<h2>JSTL 반복문 c:forEach</h2>
	<p>1~10 까지의 숫자 출력</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i } &nbsp;
	</c:forEach>
	<p>forEach 문 종료 후 \${i } 값 출력 : -${i }-</p>
	<hr>
	
	<p>(실습)1~10 까지의 숫자 중 짝수만 출력(step="2") 사용</p>
	<c:forEach var="i" begin="2" end="10" step="2">
    	${i } &nbsp;
	</c:forEach>
	<hr>
	<p>(실습)1~10 까지의 숫자 중 짝수만 출력(step="1") 사용</p>
	<c:forEach var="i" begin="1" end="9" step="2">
    	${i } &nbsp;
	</c:forEach>
	<hr>
	
	<p>(실습)1~10 까지의 합계 구하기</p>
	<c:set var="sum" value="0" scope="page"/> <%-- 변수 생략 가능 --%>
	<c:forEach var="i" begin="1" end="10" step="1">
    	<c:set var="sum" value="${sum+i}" /> <%-- 연산처리 --%>
    	<%-- ${sum = sum + i } --%> <%-- 연산과정 화면에 출력(EL 사용) --%>
    	<%-- ${sum += i } --%> <%-- 복합 대입 연산자(문자열 붙이기라서 필요(X) : 01 02 03...) --%>
	</c:forEach>
		<h3>sum : ${sum} &nbsp;</h3>
	<hr><hr>
	
	<%-- ==== for 문 집합객체 처리 ==== --%>
<%
	String[] arr = {"홍길동1", "홍길동2", "홍길동3", "홍길동4" };
	for (String name : arr) {
		out.print(name + " ");
	}
	// JSTL, EL에서 사용할 수 있게 현재 page에서 사용토록 page, request scope에 저장
	pageContext.setAttribute("attr_names", arr);	
	//request.setAttribute("attr_names", arr);
%>	
	<h2>forEach 문 집합객체 처리</h2>
	<h3>배열값 출력 - JSTL forEach</h3>
	<ol>
	<c:forEach var="name" items="${attr_names }">
		<li>${name }</li>
	</c:forEach>
	</ol>
	<hr><hr>
	
	<%-- ==== forTokens ==== --%>
	<h2>forTokens 태그 : 문자열 자르기</h2>
	<c:set var="names" value="김유신,이순신/홍길동,일지매/둘리,고길동" />
	<p>문자열 데이터 : ${names }</p>
	
	<h3>forTokens 태그 사용 / 구분자로 문자열 자르기</h3>
	<c:forTokens var="name" items="${names }" delims="/">
		<p>${name }</p>
	</c:forTokens>
	<hr>
	
	<h3>forTokens 태그 사용 , 구분자로 문자열 자르기</h3>
	<c:forTokens var="name" items="${names }" delims=",">
		<p>${name }</p>
	</c:forTokens>
	<hr>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br>
	
	
</body>
</html>