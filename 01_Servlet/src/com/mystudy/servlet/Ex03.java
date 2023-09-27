package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> Ex03.doGet() 실행~~~~~");
		
		//클라이언트가 전달한 데이터를 받아서 HTML 문서를 만들어서 되돌려줌(응답)
		// URL 요청 형식 : 요청명?파라미터명=값&파라미터명=값
		// URL 요청 내용 예) test03?name=hong&age=27
		//-----------------
		// 응답 데이터 모양
		// 이름 : hong
		// 나이 : 27
		
		// request 객체(인스턴스)로 부터 파라미터 값 추출
		// request.getParameter(파라미터명) : 1개의 파라미터 값 추출(확인)
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		System.out.println("> name : " + name + ", age : " + age);
		
		//응답처리
		//한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>전달받은 데이터(이름,나이)</h1>");
		out.println("<h2>이름 : " + name + "</h2>");
		out.println("<h2>나이 : " + age + "</h2>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> Ex03.doPost() 실행 --------");
		//전달받은 데이터 한글처리(UTF-8)
		req.setCharacterEncoding("UTF-8");
		
		doGet(req, resp);
	}

}
