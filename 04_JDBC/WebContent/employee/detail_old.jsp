<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 사번(sabun) 데이터 DB 조회해서 화면에 표시 --%>
<%
	//1. 전달받은 사번(sabun) 값 확인(추출)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	
	//2. DB 데이터 조회
	/*
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	*/

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	//DB 데이터 저장할 변수 선언 (try 구문 밖에 해야지 전체에 적용 가능)
	String name = null;
	Date regdate = null;
	int pay = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(JdbcUtil.DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		//conn = DriverManager.getConnection(JdbcUtil.URL, JdbcUtil.USER, JdbcUtil.PASSWORD);
		conn = JdbcUtil.getConnection();
		
		String sql = "";
		sql += "SELECT SABUN, NAME, REGDATE, PAY ";
		sql += "  FROM EMPLOYEE ";
		sql += " WHERE SABUN = ? ";
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, sabun);
		
		//4. SQL 실행 결과에 대한 처리
		//4-1. SQL문 실행
		rs = pstmt.executeQuery();
		
		//4-2. SQL 실행결과에 대한 처리
		if (rs.next()) {
			name = rs.getString("NAME");
			regdate = rs.getDate("REGDATE");
			pay = rs.getInt("PAY");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtil.close(conn, pstmt, rs);
	}
	
	//3. 화면에 표시
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<h1>상세보기 [detail.jsp]</h1>
	<table border>
		<tr>
			<th>사번</th>
			<td><%=sabun %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=regdate %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=pay %></td>
		</tr>
	</table>
</body>
</html>