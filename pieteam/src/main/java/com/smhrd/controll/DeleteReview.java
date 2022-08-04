package com.smhrd.controll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ReviewDAO;

public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.deleteReview(num);
		
		if(cnt>0) {
			System.out.println("삭제 성공");
			response.sendRedirect("reviewList.jsp");
		}else {
			System.out.println("삭제 실패");
			response.sendRedirect("reviewView?num="+num+".jsp");
		}
		
	}

}
