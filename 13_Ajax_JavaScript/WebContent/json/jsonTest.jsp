<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax JSON</title>
</head>
<body>
	<h1>Ajax JSON 데이터 요청 처리</h1>
	<hr>
<script>
	/* XMLHttpRequest.readyState : 데이터 전달 결과 상태를 표시
	0 : 객체생성, open 안한 상태
	1 : open상태, send 안한 상태
	2 : send 진행한 상태, 데이터가 발견되지 않은 상태
	3 : 일부 데이터만 받은 상태(데이터를 받는 중)
	4 : 데이터를 전부 응답 받은 상태
	
	XMLHttpRequest.status : 응답 결과 값
	200(성공), 4xx(클라이언트 오류), 5xx(서버측 오류 - 개발자 실수)
	***************/
	
	//1. XMLHttpRequest 객체 생성
	let xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		console.log("readyState: " + xhr.readyState + ", status : " + xhr.status);
		if (xhr.readyState == 4 && xhr.status == 200) { //정상 응답 완료
			console.log(">>> 리턴받은 값(문자열) : " + xhr.responseText);
			//전달받은 데이터 화면에 표시
			console.log(xhr.responseText);
			
			//JSON.parse() 사용 : 문자열 ---> JS 객체화
			let json = JSON.parse(xhr.responseText);
			console.log("JSON.parse 처리 후 : " + json);
			console.log(json);
			console.log(json.products); //배열
			
			//JSON 객체에서 데이터 추출
			let products = json.products;
			let htmlTag = "";
			for (let i = 0; i < products.length; i++) {
				htmlTag += "<h2>";
				htmlTag += products[i].name + " : " + products[i].price;
				htmlTag += "<h2>";
			}
			document.body.innerHTML += htmlTag;
			document.body.innerHTML += "<hr>";
			
			htmlTag = "";
			for (let product of products) {
				htmlTag += "<h2>" + product.name + ":" + product["price"] + "</h2>";
			} // product.name & product["price"] 둘 다 사용 가능! 
			  // BUT []안에 속성 이름에 해당하는 문자열 넣어야 함!
			document.body.innerHTML += htmlTag;
			
			
		} else if (xhr.readyState == 4 && xhr.status != 200){
			console.log(">>> 오류발생~~  status : " + xhr.status);
		}
	};
	
	//2. open("전송방식", "요청정보", 비동기여부)
	xhr.open("GET", "data.json", true);
	
	//3. send() 실행
	xhr.send();
</script>	
</body>
</html>