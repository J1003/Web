<%@page import="com.mystudy.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : Array, List, Set, Map</h1>
	<h2>Array 출력 ==============</h2>
	<p>출력대상 : {"a", "ab", "abc", "abcd"}</p>
<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs); // 페이지 상에 등록
%>
	<p>배열데이터 : <%=Arrays.toString(strs) %></p>
	<c:forEach var="str" items="${arr }">
		<p>${str }</p>
	</c:forEach>
	
	<h3>배열(Array) 일부 데이터만 사용(2,3번째 : 1,2번 인덱스)</h3>
	<h3>forEach var="str" items="\${arr }" begin="1" end="2"</h3>
	<ul>
	<c:forEach var="str" items="${arr }" begin="1" end="2">
		<li>${str }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<!-- ===== List 출력 ==== -->
	<h2>List 출력 ==================</h2>
<%
	List<Integer> list = new ArrayList<Integer>(); 
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("alist", list);
%>	
	<ul>
	<c:forEach var="listItem" items="${alist }">
		<li>${listItem }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- ==== Set 출력 ===== --%>
	<h2>Set 사용 ==================</h2>
<%
	Set<String> set = new HashSet<>();
	set.add("홍길동");
	set.add("김유신");
	set.add("강감찬");
	set.add("을지문덕");
	set.add("을지문덕");
	System.out.println("set :" + set);
	System.out.println("set.size() :" + set.size());
	System.out.println("set.contains(\"홍길동\") :" + set.contains("홍길동"));
	pageContext.setAttribute("hset", set);
%>
	<p>hset : ${hset }</p> <!-- 브라우저 화면에 출력 -->
	<p>hset.size() : ${hset.size() }</p>
	<p>hset.contains("홍길동") : ${hset.contains("홍길동") }</p>
	<p>hset.toString() : ${hset.toString() }</p>
	
	<ul>
	<c:forEach var="name" items="${hset }" begin="1" end="2">
		<li>${name }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- ===== Map key-value 데이터 출력 --%>
	<h2>Map 사용 =================</h2>
<%
	Map<String, String> map = new HashMap<>();
	map.put("k1", "a");
	map.put("k2", "ab");
	map.put("k3", "abc");
	map.put("k4", "abcd");
	System.out.println("map : " + map);
	pageContext.setAttribute("hmap", map);
%>	
	<p>--- Map 특정 데이터 key 값으로 조회 ---</p>
	\${hmap.k1 } : ${hmap.k1 }<br>
	\${hmap.k2 } : ${hmap.k2 }<br>
	\${hmap.k3 } : ${hmap["k3"] }<br> <!-- .(점) 대신에 [] 대괄호 처리 가능 대신 따옴표 필수! -->
	\${hmap.k2 } : ${hmap['k4'] }<br> 
	
	<p>==== Map 전체 데이터 조회 =====</p>
	<c:forEach var="mapData" items="${hmap }">
		<p>
		\${mapData } : ${mapData }<br>
		\${mapData.key } : ${mapData.key }<br>
		\${mapData.value } : ${mapData.value }
		</p>
	</c:forEach>
	<p>-----------------</p>
	
	<p>hmap.keySet() 사용 key값 확인</p>
	<c:forEach var="key" items="${hmap.keySet() }">
		${key }
	</c:forEach>
	
	<p>-----------------</p>
	<p>hmap.values() 사용 value값 확인</p>
	<c:forEach var="value" items="${hmap.values() }">
		${value }
	</c:forEach>
	
	<%-- ========================== --%>
	<h1>VO가 담긴 List 사용 =================</h1>
<%
	List<PersonVO> listBean = new ArrayList<>();
	listBean.add(new PersonVO("홍길동", "27"));
	listBean.add(new PersonVO("김유신", "33"));
	listBean.add(new PersonVO("을지문덕", "40"));
	listBean.add(new PersonVO("강감찬", "50"));
	
	System.out.println("listBean : " + listBean);
	pageContext.setAttribute("persons", listBean);
%>	
	<%-- (실습) persons에 있는 PersonVO 객체의 이름, 나이 화면출력 --%>
	<h3>(실습 - SSAM 풀이)</h3>
	\${persons } : ${persons }<br>
	\${empty persons } : ${empty persons }<br>
	<c:if test="${empty persons }">
		데이터가 없습니다(\${empty persons } : ${empty persons })
	</c:if>
	
	<c:forEach var="person" items="${persons }">
		<p>${person.name }, ${person.age }</p>
	</c:forEach>
	<hr>
	
	<h3>(실습 - 나의 풀이)</h3>
	<c:forEach var="person" items="${persons }">
		<p>이름 : ${person.getName()} / 나이 : ${person.getAge() }</p>
	</c:forEach>
	<hr>
	
	<%-- 친구1 풀이 --%>
	<h3>(실습 - 친구1 풀이)</h3>
	<p>hset : ${hset }</p>
	<ul>
	<c:forEach var="name" items="${persons }" >
		<li>${name }</li>
	</c:forEach>
	</ul>
	
	<ul>
	<c:forEach var="person" items="${persons }" >
		<li>이름 : ${person.name } / 나이 : ${person.age } </li>
	</c:forEach>
	</ul>
	
</body>
</html>