<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 입력처리 
	정상입력: list.jsp 페이지로 이동(입력건수 0보다 크면 list.jsp 재요청처리)
	예외발생: 현재 페이지에 오류메시지 보여주기
--%>
<%
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	//1. 파라미터 값 추출(sabun, name, pay)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	String pay = request.getParameter("pay");
	
	//2. DB 입력작업
	try {
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		// 이전 코드의 SQL 쿼리를 수정
		String sql = "INSERT INTO EMPLOYEE (SABUN, NAME, REGDATE, PAY) VALUES (?, ?, SYSDATE, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, sabun); 
		pstmt.setString(2, name);
		pstmt.setInt(3, Integer.parseInt(pay));
	
		int insertedRows = pstmt.executeUpdate();

		//3. 화면전환
		if (insertedRows > 0) {
			// 정상 입력 처리: 입력 건수가 0보다 크면 list.jsp로 이동
			response.sendRedirect("list.jsp");
		} else {
			// 입력 실패 처리: 오류 메시지를 현재 페이지에 표시
%>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원 등록 실패</h1>
	<p>
		입력처리를 하지 못했습니다<br> 담당자(8282)에게 연락하세요
	</p>

	<a href="addForm.jsp">입력페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>