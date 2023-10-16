package com.mystudy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

@WebServlet("/deptList")
public class DeptListController extends HttpServlet { //servlet으로 만들기 위해 extends 해준다.
	
	// doGet()을 오버라이드 ctrl+space 처리 해주면 된다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(":: DeptListController doGet() 시작----");
		//전달받은 부서코드로 DB데이터 조회 후 deptList.jsp 응답처리
		//1. 전달받은 파라미터값(부서코드: deptno [dept.jsp에 있는]) 확인
		String deptno = req.getParameter("deptno");
		
		//2. DB에서 해당부서(deptno)에 있는 직원 조회(DAO사용)
		List<EmployeeVO> list = EmployeeDAO.getDeptList(deptno); // list를 리턴받는다.
		
		//3. 조회된 데이터를 응답페이지(deptList.jsp)에서 사용토록 scope에 저장
		req.setAttribute("list", list);
		
		//4. 응답페이지(deptList.jsp)로 포워딩(위임) 처리
		req.getRequestDispatcher("deptList.jsp").forward(req, resp);
		
		System.out.println(":: DeptListController doGet() 끝----");
	}
	
	// doPost()를 오버라이드
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(":: DeptListController doPost() 시작----");
		
		req.setCharacterEncoding(getServletInfo()); //한글데이터 사용시 한글깨짐 방지!!
		doGet(req,resp); // get에 다 구현이 되어있으니 doGet 호출!!
		
		System.out.println(":: DeptListController doPost() 끝----");
	}
}
