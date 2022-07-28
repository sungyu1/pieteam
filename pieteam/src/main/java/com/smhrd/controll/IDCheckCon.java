package com.smhrd.controll;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;

public class IDCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputID = request.getParameter("inputID");
		
		MemberDAO dao = new MemberDAO();
		boolean checkID = dao.idCheck(inputID);
		
		// 값이 없으면 false 있으면 true
		System.out.println(checkID);
		
		PrintWriter out = response.getWriter();
		out.print(checkID);
	}

}
