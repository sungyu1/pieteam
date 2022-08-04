package com.smhrd.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MateDAO;

public class DeleteMate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int mate_seq = Integer.parseInt(request.getParameter("num"));
		
		MateDAO dao = new MateDAO();
		int cnt = dao.deleteMate(mate_seq);
		
		if(cnt>0) { // 삭제 성공
			System.out.println("삭제 성공");
			response.sendRedirect("schoolmateList.jsp");
		}else { // 삭제 실패
			System.out.println("삭제 실패");
			response.sendRedirect("MateView?num="+mate_seq+".jsp");
		}
	}

}
