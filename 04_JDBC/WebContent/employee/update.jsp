 <%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터로 DB데이터 수정처리 후 페이지 전환 
	수정할데이터 : 성명, 금액, 날짜(SYSDATE)
	정상처리 후 : list.jsp 또는 detail.jsp 페이지 이동 처리
	예외발생시 : 현재 페이지에 오류메시지 보여주기
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>데이터 수정</title>
</head>
<body>
<%
    // JDBC 드라이버 및 데이터베이스 연결 정보
    final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
    Connection conn = null;
    PreparedStatement pstmt = null;

    // 요청에서 전달받은 매개변수 추출
    int sabun = Integer.parseInt(request.getParameter("sabun"));
    String name = request.getParameter("name");
    int pay = Integer.parseInt(request.getParameter("pay"));

    try {
        // JDBC 드라이버 로딩
        Class.forName(JdbcUtil.DRIVER);

        // 데이터베이스 연결
        conn = JdbcUtil.getConnection();

        // SQL 쿼리 작성 (예: 사원 정보 수정)
        String updateQuery = "UPDATE employee SET name=?, pay=? WHERE sabun=?";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, name);
        pstmt.setInt(2, pay);
        pstmt.setInt(3, sabun);

        // SQL 쿼리 실행
        int updatedRs = pstmt.executeUpdate();

        if (updatedRs > 0) {
            // 데이터 수정 성공 시
            response.sendRedirect("list.jsp"); // 수정 후 목록 페이지로 이동
        } else {
        	// 데이터 수정 실패 시
%>
        <script>
            alert("데이터 수정에 실패했습니다.");
            history.back(); // 뒤로 가기 버튼을 누르면 이전 페이지로 이동
        </script>
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
</body>
</html>