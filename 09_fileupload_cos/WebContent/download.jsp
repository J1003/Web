<%@page import="java.io.File"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 사용해서 파일 다운로드 처리 --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//전달받은 파라미터 값 확인(추출)
	String path = request.getParameter("path"); //저장된 폴더(디렉토리)명
	String filename = request.getParameter("filename"); //물리적으로 저장된 파일명
	System.out.println(">> path : " + path);
	System.out.println(">> filename : " + filename);
	
	//실제 파일이 저장된 경로 확인
	String realpath = this.getServletContext().getRealPath("upload");
	System.out.println(">> realpath : " + realpath);
	
	//다운로드 받을 수 있도록 클라이언트 응답 문서타입 변경
	response.setContentType("application/x-msdownload");
	
	//클라이언트 헤더정보를 첨부파일이 있는 것으로 변경
	response.setHeader("Content-Disposition", "attachment;filename=" + filename);
	
	//----- 실제 파일 읽고 / 쓰기 작업 -----
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	
	BufferedOutputStream bos = null;
	
	File file = new File(realpath + "/" + filename); //물리적으로 읽을 파일
	
	if (file.isFile()) {
		try {
			//파일 읽기 객체 생성
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			
			//파일 쓰기 객체 생성
			bos = new BufferedOutputStream(response.getOutputStream());
			
			
			//파일 읽고, 쓰기 반복 
			int readValue = bis.read();
			while (readValue != -1) { //(더이상 읽고 쓸 데이터가 없을 때까지 반복)
				bos.write(readValue); //읽고
				readValue = bis.read(); //쓰고
			}
			//
			/* JSP 출력스트림 & Servlet 출력스트림이 겹쳐서
			   발생하는 오류 발생시 해결 방법 */
			out.clear();
			out = pageContext.pushBody();
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			bos.close();
			bis.close();
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>