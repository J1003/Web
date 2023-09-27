<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션에 설정된 데이터 삭제(remove) --%>
<%
	//설정값을 변경
	//session.setAttribute("attr_age", "33"); //속성값 변경
	
	//속성값을 삭제
	session.removeAttribute("attr_age"); //설정된 속성자체를 삭제
	
	//세션에 저장된 데이터명 확인
	Enumeration<String> names = session.getAttributeNames();
	while (names.hasMoreElements()) {
		System.out.println(":: 저장명 : " + names.nextElement());
	}
	
	//재요청 처리
	response.sendRedirect("ex01_session.jsp");
%>