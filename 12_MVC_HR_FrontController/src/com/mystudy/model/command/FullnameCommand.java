package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

public class FullnameCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// fullname 요청 처리(입력폼/직원목록)
		//0. 파라미터 값 확인(추출)
		String name = request.getParameter("name");
		System.out.println(">> FullnameCommand name : " + name);
		
		if (name == null) {
			return "fullname.jsp";
		} 
		
		//전달받은 이름으로 DB데이터 조회 후 목록페이지로 이동
		List<EmployeeVO> list = EmployeeDAO.getFullnameList(name);
		request.setAttribute("list", list);
		
		return "fullnameList.jsp";
	}

}

