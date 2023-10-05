<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script>
	function sel_all(frm){ //전체 데이터 조회
		frm.action = "selectAll.jsp";
		frm.submit();		
	}
	
	function sel_one(frm) { //ID로 검색
		frm.action = "selectOneID.jsp";
		frm.submit();	
	}
</script>
</head>
<body>
	<%@ include file="includee/menu.jspf" %>
	
</body>
</html>