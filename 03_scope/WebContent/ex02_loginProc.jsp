<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디, 암호 사용해서 로그인 처리여부 판단 --%>
<%
	//1. 파라미터 값 추출(확인)
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//2. 아이디, 암호 확인해서 로그인 처리여부 판단
	// DB연결 안했으니 id:hong, pwd:pw1234 이면 로그인 성공, 나머지 실패
	boolean loginSuccess = false;
	if ("hong".equals(id) && "pw1234".equals(pwd)) {
		loginSuccess = true;
	}
	
	//3. 로그인 성공/실패에 따른 처리 - session에 데이터 저장
	// 로그인 성공 : login_chk = "ok"
	// 로그인 실패 : login_chk = "fail"
	if (loginSuccess) {
		session.setAttribute("login_chk", "ok");
		session.setAttribute("id", id);
	} else {
		session.setAttribute("login_chk", "fail");
	}
	System.out.println(":: login_chk : " + session.getAttribute("login_chk"));
	
	//4. 페이지 전환 - ex02_login.jsp
	response.sendRedirect("ex02_login.jsp");
%>