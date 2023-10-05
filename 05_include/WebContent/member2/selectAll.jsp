<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB에서 전체 데이터 조회해서 화면 출력 --%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		//1. JDBC 드라이버 로딩
		//Class.forName(DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		//conn = DriverManager.getConnection(URL, USER, PASSWORD);
		conn = JdbcUtil.getConnection();
		
		String sql = ""
				+ "SELECT IDX, ID, PWD, NAME, AGE "
				+ "     , NVL(ADDRESS, '주소없음') AS ADDRESS, REG "
				+ "     , TO_CHAR(REG, 'YYYY-MM-DD') REG2 "
				+ "  FROM MEMBER2 "
				+ " ORDER BY IDX ";
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
	
		//4. SQL 실행 결과에 대한 처리
		//4-1. SQL문 실행
		rs = pstmt.executeQuery();		
%>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체데이터검색</title>
<script type="text/javascript" src="includee/event.js"></script>
</head>
<body>
	<%@ include file="includee/menu.jspf" %>
	
	<hr>
	
	<h1>전체데이터 검색</h1>
	<table border>
	<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>나이</th>
			<th>주소</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
<%		
		while (rs.next()) { %>
		<tr>
			<td><%=rs.getInt("IDX") %></td>
			<td><%=rs.getString("ID") %></td>
			<td><%=rs.getString("PWD") %></td>
			<td><%=rs.getString("NAME") %></td>
			<td><%=rs.getInt("AGE") %></td>
			<td><%=rs.getString("ADDRESS") %></td>
			<%-- <td><%=rs.getDate("REG") %></td> --%>
			<td><%=rs.getString("REG2") %>
		</tr>	
<% 
		} %>	
	</tbody>
	</table>
</body>
</html>

<%
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtil.close(conn, pstmt, rs);
	}
%>			