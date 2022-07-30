package com.smhrd.controll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

public class RevieWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("loginMember");
		
		String id = vo.getM_id();
		
		String name = request.getParameter("name");
		String review = request.getParameter("review");
		
		Review reviewVO = new Review(review, id, name);
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.insertReview(reviewVO);
		
		if(cnt>0) {
			System.out.println("작성성공");
			response.sendRedirect("boardListPaging.jsp");
		}else {
			System.out.println("작성실패");
			response.sendRedirect("reviewWrite.jsp");
		}
	}

}
