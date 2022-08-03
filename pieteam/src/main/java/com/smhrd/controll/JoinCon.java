package com.smhrd.controll;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청데이터 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 요청데이터(파라미터) 받기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");
		BigDecimal age = new BigDecimal(request.getParameter("age"));
		
		Member vo = new Member(id, pw, name, nickname, gender, age);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.insertMember(vo);
		
		if(cnt>0) { // 회원가입 성공
			System.out.println("회원가입 성공");
			RequestDispatcher rd = request.getRequestDispatcher("joinS.jsp");
			/* request.setAttribute("joinMember", vo); */
			request.setAttribute("joinMember", vo);
			rd.forward(request, response);
		}else { // 회원가입 실패
			System.out.println("회원가입 실패");
			response.sendRedirect("login.jsp");
		}
	}

}
