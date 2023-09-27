<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션초기화(무효화) 후 로그인페이지로 이동 --%>
<%
	session.invalidate();
	response.sendRedirect("ex02_login.jsp");
%>
