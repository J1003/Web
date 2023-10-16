<%@page import="com.mystudy.bbs.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="com.mystudy.bbs.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- 전달받은 파라미터 값(bbsIdx) 사용 DB데이터 조회 화면표시
	1. 게시글 조회수 1 증가(실습)
	2. 게시글(bbsIdx) 데이터 조회 후 화면 표시
	3. 게시글(bbsIdx)에 딸린 댓글이 있으면 조회 후 화면 표시
--%>
<%
	//파일미터 값 추출(확인)
	int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
	String cPage = request.getParameter("cPage");
	
	//1. 게시글 조회수 1 증가(실습)
	
	//2. 게시글(bbsIdx) 데이터 조회 후 화면 표시
	BbsVO bvo = BbsDAO.selectOne(bbsIdx);
	System.out.println("bvo : " + bvo);
	
	//3. 게시글(bbsIdx)에 딸린 댓글이 있으면 조회 후 화면 표시
	List<CommentVO> commList = BbsDAO.getCommList(bbsIdx);
	System.out.println("commList : " + commList);
	
	//JSTL, EL 사용을 위한 scope 상에 데이터 등록하기
	session.setAttribute("bvo", bvo); //게시글 데이터
	session.setAttribute("cPage", cPage);
	
	pageContext.setAttribute("c_list", commList); //댓글 목록
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세</title>
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs th {
		border: 1px solid black;
		padding: 4px 10px;
		text-align: center;
		width: 30%;
		background-color: coral;
	}
	#bbs td {
		border: 1px solid black;
		padding: 4px 10px;
		text-align: left;
	}
</style>
<script>
	function modify_go()
		location.href = "modify.jsp"; //sessionScope의 값을 가져다 사용
	}
	function delete_go()
		location.href = "delete.jsp"; //sessionScope의 값을 가져다 사용
	}
	function list_go()
		location.href = "list.jsp?cPage=${cPage}"; //list에 있는 cPage 파라미터값을 불러옴
	}
</script>
</head>
<body>

<div id="bbs">
	<%--게시글 내용 표시 --%>
	<table>
		<caption>상세보기</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>${bvo.subject }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bvo.writer }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${empty bvo.fileName }">
						첨부파일없음
					</c:if>
					<c:if test="${not empty bvo.fileName }">
						<a href="download.jsp?filename=${bvo.fileName }">${bvo.oriName }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${bvo.content }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정(개인실습)" onclick="modify_go()">
					<input type="button" value="삭제(개인실습)" onclick="delete_go()">
					<input type="button" value="목록보기" onclick="list_go()">
				</td>
			</tr>
		</tfoot>
	</table>
	<hr>
	
	<%--게시글에 대한 댓글 작성 영역--%>
	<form action="ans_write_ok.jsp" method="get">
		<p>
			작성자 : <input type="text" name="writer">
			비밀번호 : <input type="password" name="pwd">
		</p>
		<p>내용 : <textarea name="content" rows="4" cols="55"></textarea></p>
		<input type="submit" value="댓글저장(개인실습)">
		<input type="hidden" name="bbsIdx" value="${bvo.bbsIdx }">
	</form>
	<hr>
	
	<%--게시글에 딸린 댓글 표시 영역 --%>	
	<c:forEach var="commVO" items="${c_list }">
	<div class="comment">
		<form action="ans_del.jsp" method="get">
			<p>작성자: ${commVO.writer } &nbsp;&nbsp; 작성일: ${commVO.writeDate }</p>
			<p>내용: ${commVO.content }</p>
			<input type="submit" value="댓글삭제">
			<input type="hidden" name="commentIdx" value="${commVO.commentIdx }">
			
			<!--댓글 삭제 후 게시글 상세페이지로 이동시 사용할 데이터 처리
				세션에 게시글데이터, 페이지번호가 없으면 명시적으로 데이터 넘기기-->
			<%-- <input type="hidden" name="bbsIdx" value="${commVO.bbsIdx }">
			<input type="hidden" name="cPage" value="${cPage }"> --%>
		</form>
	</div>
	<hr>
	</c:forEach>
	
	
</div>

</body>
</html>