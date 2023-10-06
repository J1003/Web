<%@page import="com.mystudy.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	MemberVO memberVO = new MemberVO();
	memberVO.setId(request.getParameter("id"));
	memberVO.setPwd(request.getParameter("pwd"));
	
	memberVO.setHobby(request.getParameterValues("hobby"));
	System.out.println("memberVO : " + memberVO);
--%>
	<jsp:useBean id="memberVO" class="com.mystudy.MemberVO" />
	<jsp:setProperty property="*" name="memberVO"/>
	
<%
	System.out.println("memberVO : " + memberVO);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입정보</title>
</head>
<body>
	<h1>회원가입정보[ ex04_useBean_proc.jsp ]</h1>
	<ul>
		<li>아이디 : <%=memberVO.getId() %></li>
		<li>암호 : <%=memberVO.getPwd() %></li>
		<li>이름 : <%=memberVO.getName() %></li>
		<li>성별 : <%=memberVO.getGender() %></li>
		<li>이메일 : <%=memberVO.getEmail() %></li>
		
		<li>취미(배열) : <%=memberVO.getHobby() %></li>
		<li>취미(배열데이터) : 
<%
		if (memberVO.getHobby() == null) {
			out.print("선택안함");
		} else {
			for (String hobby : memberVO.getHobby()) {
				out.print(hobby + " ");
			}
		}
%>	
		</li>
	</ul>
	<hr>
	<h2>EL 사용</h2>
	<ol>
		<li>성별 : <%=memberVO.getGender() %></li>
		<li>성별(EL) : ${memberVO.getGender() }</li>
		<li>취미(배열) : <%=memberVO.getHobby() %></li>
		<li>취미(배열) EL : ${memberVO.getHobby() }</li>
		<li>취미(배열데이터) EL : 
			${memberVO.hobby[0] }
			${memberVO.hobby[1] }
			${memberVO.hobby[2] }
			${memberVO.hobby[3] }
		</li>
	</ol>
</body>
</html>