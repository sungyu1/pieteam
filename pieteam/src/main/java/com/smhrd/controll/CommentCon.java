package com.smhrd.controll;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Comment;
import com.smhrd.model.CommentDAO;
import com.smhrd.model.Member;

public class CommentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String reviewnum = request.getParameter("reviewnum");
		BigDecimal r_seq = new BigDecimal(reviewnum); // String to BigDecimal
		
		String comment = request.getParameter("comment");
		
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("loginMember");
		String writer = vo.getM_id();
		
		Comment commentVO = new Comment(r_seq, comment, writer);
		
		CommentDAO dao = new CommentDAO();
		int cnt = dao.insertComment(commentVO);
		
		response.setCharacterEncoding("UTF-8"); // 응답데이터인코딩
		PrintWriter out = response.getWriter();
		
		if(cnt>0) { // 댓글작성 성공
			out.print("success");
		}else { // 댓글작성 실패
			out.print("fail");			
		}
	}

}
