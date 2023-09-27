<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 주문한 내역에 따라 계산하고 결과를 표시 --%>
    
<%	
	// (실습)주문한 내역에 따라 계산하고 결과를 표시
	// 1. 파라미터 값 추출(확인)
	// 2. 계산처리 : 구입금액, 잔액표시
	// 3. 결과 표시
	// -------------------------------------
	
	// 1. 파라미터 값 추출(확인)
	String coffeeValue = request.getParameter("coffee");
	String coffee = "";
	int price = 0;

	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	

	if(coffeeValue == null){
		response.sendRedirect("08_req_coffee.jsp"); //재요청
		return;
	}

	switch (coffeeValue) {
	case "1" :
		coffee = "아메리카노";
		price = 3000;
		break;
	case "2" : 
		coffee = "카페모카";
		price = 3500;
		break;
	case "3" : 
		coffee = "에스프레소";
		price = 2500;
		break;
	case "4" : 
		coffee = "카페라떼";
		price = 4000;
		break;
	}
	// 2. 계산처리 : 구입금액, 잔액표시
	int totalPrice = price * su;
	int change = money - totalPrice;

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
	-----
	입금액 : 10000원
	잔액 : 1000원(입금액-구입금액)
 --%>
	<ul>
		<li>커피종류 : <%=coffee%></li>
		<li>단가 : <%=price%></li>
		<li>수량 : <%=su%></li>
		<li>구입금액 : <%=totalPrice%></li>

		<li>입금액 : <%=money%></li>
		<li>잔액 : <%=change%></li>
	</ul>
	
</body>
</html>