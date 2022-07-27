package com.smhrd.controll;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class UpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String id = loginMember.getM_id();
		
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nickname");
		
		String gender = loginMember.getM_gender();
		BigDecimal age = loginMember.getM_age();
		
		Member updateMember = new Member(id, pw, name, nick, gender, age);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.updateMember(updateMember);
		
		if(cnt>0){ // 수정성공
			System.out.println("수정성공!");
			session.setAttribute("loginMember", updateMember);
			response.sendRedirect("main.jsp");
		}else { // 수정실패
			System.out.println("수정실패!");			
			response.sendRedirect("update.jsp");
		}
	}

}
