<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--주문한 내역에 따라 계산하고 결과를 표시 --%>
<%
	//(실습)주문한 내역에 따라 계산하고 결과를 표시
	//1. 파라미터 값 추출(확인)
	String coffee = request.getParameter("coffee");
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	System.out.println("coffee : " + coffee);
	System.out.println("su : " + su);
	System.out.println("money : " + money);
	
	if (coffee == null) {
		System.out.println(">>> 메뉴선택안됨 coffee : " + coffee);
		response.sendRedirect("08_req_coffee.jsp");
		return;
	}
	
	
	
	//2. 계산처리 : 구입금액, 잔액
	//2-1. 메뉴선택에 따른 메뉴명, 단가 확인
	String menu = "선택안됨"; //선택메뉴명
	int danga = 0; //선택메뉴에 대한 단가
	
	if ("1".equals(coffee)) {
		menu = "아메리카노";
		danga = 3000;
	} else if ("2".equals(coffee)) {
		menu = "카페모카";
		danga = 3500;
	} else if ("3".equals(coffee)) {
		menu = "에스프레소";
		danga = 2500;
	} else if ("4".equals(coffee)) {
		menu = "카페라떼";
		danga = 4000;
	} 
	System.out.println("메뉴명 : " + menu + ", 단가 : " + danga);
	
	//2-2. 구입금액(total), 잔액(change) 계산 처리
	int total = danga * su;
	int change = money - total;
	
	//3. 결과 표시
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2>주문 계산 결과(응답-08_resp.jsp)</h2>
<%--
	커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원 (단가 * 수량)
	------------
	입금액 : 10000원
	잔액 : 1000원 (입금액 - 구입금액)
--%>	
	<ul>
		<li>커피종류 : <%=menu %></li>
		<li>단가 : <%=danga %></li>
		<li>수량 : <%=su %></li>
		<li>구입금액 : <%=total %></li>
		<li>입금액 : <%=money %></li>
		<li>잔액 : <%=change %></li>
	</ul>
</body>
</html>