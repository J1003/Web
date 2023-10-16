<%@page import="com.mystudy.bbs.dao.BbsDAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 전달받은 데이터 값을 DB에 입력하고 list.jsp 이동 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
	
	<%-- (주의) enctype="multipart/form-date" 사용시 setProperty 값 설정 안 됨 --%>
	<jsp:useBean id="testVO" class="com.mystudy.bbs.vo.BbsVO" />
	<jsp:setProperty property="*" name="testVO" />
	\${testVO } : ${testVO } <%-- 데이터 저장 안 됨 --%>
	<hr>
	\${param.usbject } : ${param.usbject } <%-- param 없음 --%>
<%
	// MutipartRequest 객체 사용!
	// 파일저장 위치
	String path = "c:/MyStudy/temp";
	//String path = "c:/upload/bbs"; // 물리적으로 존재하지 않는 폴더
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024), 
			"UTF-8", new DefaultFileRenamePolicy());
	
	// 전달받은 데이터 VO에 저장 후 DB에 입력 처리(DB 연동작업)
	BbsVO bvo = new BbsVO();
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setContent(mr.getParameter("content"));
	bvo.setPwd(mr.getParameter("pwd"));
	
	bvo.setIp(request.getRemoteAddr()); //getRemoteAddr 하면 id 정보 가져올 수 있음!
	System.out.println(">> wirte_ok.jsp bvo : " + bvo);
	
	// 첨부파일 데이터 처리
	if (mr.getFile("filename") != null) { //첨부파일 있으면
		bvo.setFileName(mr.getFilesystemName("filename"));
		bvo.setOriName(mr.getOriginalFileName("filename"));
	} else { //첨부파일 없으면
		bvo.setFileName("");
		bvo.setOriName("");
	}
	
	//DB에 입력(저장) 처리
	BbsDAO.insert(bvo);
	
	//화면전환(목록페이지로 이동 - 첫페이지로 가기)
	response.sendRedirect("list.jsp");
%>