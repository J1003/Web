<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	//$(document).ready(function(){});
	//$().ready(function(){});
	//$(function(){});
	$(document).ready(function(){
		$("#getDataBtn").click(ajaxGetXmlMembers);
	});
	function ajaxGetXmlMembers(){
		alert(">> ajaxGetXmlMembers() 실행~~");
		
		$.ajax("getXmlMembers", { //url 속성값을 첫번째 파라미터로 빼낼 수 있다.
			//url : "getXmlMembers",
			type : "get",
			dataType : "xml", // 응답 받을 데이터 타입 : xml
			success : function(respData){ //respData라는 파라미터 변수에 받겠다!
				alert(">> 성공");
				console.log(respData);
				
				//XML 데이터 사용 tbody 영역에 tr 만들어 넣기 (HTML 태그 다루듯이!)
				let htmlTag = "";
				//console.log($(respData)find("member")); //콘솔에 찍어보기
				$(respData).find("member").each(function(){
					// 콘솔에 찍어보는 작업
					//console.log($(this).find("idx").text()); //this : 현재객체, text()나 html() 둘 다 똑같음!
					//console.log($(this).find("name").text());
					htmlTag += "<tr>";
					htmlTag += "<td>" + $(this).find("idx").text() + "</td>";
					htmlTag += "<td>" + $(this).find("name").text() + "</td>";
					htmlTag += "<td>" + $(this).find("age").text() + "</td>";
					htmlTag += "<td>" + $(this).find("addr").text() + "</td>";
					htmlTag += "<td>" + $(this).find("regdate").text() + "</td>";
					htmlTag += "</tr>";
				});
				$("#tbody").html(htmlTag); // 브라우저 화면에 tag를 만들어서 집어넣기
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert(">> Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
			}
		});
	}
</script>
</head>
<body>
	<h1>Ajax XML 데이터 요청 처리</h1>
	<button id="getDataBtn">Ajax - XML 데이터 가져오기</button>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td>1</td>
				<td>홍길동</td>
				<td>27</td>
				<td>서울</td>
				<td>2023-10-17</td>
			</tr>
		</tbody>
	</table>
</body>
</html>