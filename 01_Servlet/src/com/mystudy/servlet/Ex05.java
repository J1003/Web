package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//(실습) 전달받은 데이터를 연산처리 후 결과를 응답처리
		//1. 전달받은 데이터(파라미터) 값 추출(확인)
		String name = req.getParameter("name");
		String sKor = req.getParameter("kor");
		int kor = Integer.parseInt(req.getParameter("kor"));
		int eng = Integer.parseInt(req.getParameter("eng"));
		int math = Integer.parseInt(req.getParameter("math"));
		
		System.out.println("name : " + name);
		System.out.println("kor : " + kor);
		System.out.println("eng : " + eng);
		System.out.println("math : " + math);
		
		//2. 계산처리 - 총점, 평균
		int tot = kor + eng + math;
		double avg = tot / 3.0;
		avg = tot * 100 / 3 / 100.0;
		avg = Math.round(tot * 100 / 3.0) / 100.0;
		
		System.out.println("tot : " + tot);
		System.out.println("avg : " + avg);
		
		//3. 응답처리(출력) - 브라우저(사용자)쪽으로 HTML태그 작성
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<h3>성적처리 결과</h3>");
		out.println("<p>이름 : " + name + "</p>");
		out.println("<p>국어 : " + kor + "</p>");
		out.println("<p>영어 : " + eng + "</p>");
		out.println("<p>수학 : " + math + "</p>");
		out.println("<p>총점 : " + tot + "</p>");
		out.println("<p>-------------</p>");
		out.println("<p>평균 : " + avg + "</p>");
		
	}
}





