package com.mystudy.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.MemberDAO;
import com.mystudy.ajax.vo.MemberVO;

@WebServlet("/getJsonMembers")
public class GetJsonMembersController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest requesst, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("::: GetJsonMembersController doGet() 실행~!");
		
		//한글깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");  
		
		//DB 데이터 가져오기
		List<MemberVO> list = MemberDAO.getList();
		System.out.println("list : " + list);
		
		//JSON 형식 문자열 만들고 응답처리
		// {"list" : [{}, {}, ..., {}]}
		String result = makeJson(list); 
		//makeJson은 내부에서 만들었으니까 마우스커서 올려서 아래처럼 create 해주기!
		
		//클라이언트에게 응답처리
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	private String makeJson(List<MemberVO> list) {
		
		 /* JSON 형식 데이터 형태 ---------------------------
		  * {"list" : [{}, {}, ..., {}]}
		 
		 { "list" : [
		 	{
		 		"idx" : 1, 
		 		"name" : "홍길동", 
		 		"age" : 27, 
		 		"addr" : "서울",
		 		"regdate" : "2023-10-17"
		 	},
		 	{}, {}, ...., {} 이런 형태로 문자열이 만들어지면 된다!
		 ]}
		 -----------------------------------------------*/
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{\"list\" : ["); //열고
		
		for (MemberVO vo : list) { //개선된 for문으로 데이터 전달 받음
			result.append("{"); //중괄호 시작
			result.append("\"idx\": " + vo.getIdx() + ",");
			result.append("\"name\": \"" + vo.getName() + "\","); //name은 문자열이라서 좌우에 쌍따옴표
			result.append("\"age\": " + vo.getAge() + ",");
			result.append("\"addr\": \"" + vo.getAddr() + "\",");
			result.append("\"regdate\": \"" + vo.getRegdate() + "\" "); // 마지막에는 콤마 빼주기!
			result.append("},"); //중괄호 닫고 콤마(,)
		}
		//result.delete(result.length() - 1, result.length()); //
		result.deleteCharAt(result.length() - 1);
		result.append("]}"); //닫고
		
		System.out.println(result.toString());
		
		return result.toString();
	}
}
