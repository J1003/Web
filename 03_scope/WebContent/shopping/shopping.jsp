<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 파라미터 값 추출
	String name = request.getParameter("name");
    if (name != null) {
    	// 페이지 전환시(요청&응답 반복이되어도)에도 계속 이름을 사용하기 위해서 session scope에 등록!
    	session.setAttribute("username", name);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품선택</title>
<script>
	function add_list(frm) {
		frm.action = "addList.jsp";
		frm.submit(); // submit함수 호출!
	}
</script>
</head>
<body>
	<h2>상품선택(shopping.jsp)</h2>
	<hr>
	[<%=session.getAttribute("username") %>]님 로그인 상태입니다.
	<hr>
	<form>
		<select name="product">
			<option selected disabled>선택하세요</option> <%-- 선택하는 메세지를 보여주는 역할만!--%>
			<option value="수박">수박</option>
			<option value="사과">사과</option>
			<option value="딸기">딸기</option>
			<option value="참외">참외</option>
			<option value="망고">망고</option>
		</select>
 		<%-- <input type="submit" value="추가"> --%>
		<input type="button" value="추가" onclick="add_list(this.form)">
								<%-- (this.form) -> form 태그가 전달된다! --%>	
	</form>
	<p><a href="list_calc.jsp">계산하기(목록확인)</a></p>
	<p><a href="logout.jsp">로그아웃</a></p>
</body>
</html>