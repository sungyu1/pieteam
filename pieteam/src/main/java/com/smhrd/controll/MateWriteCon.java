package com.smhrd.controll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Mate;
import com.smhrd.model.MateDAO;
import com.smhrd.model.Member;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

public class MateWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("loginMember");
		
		String id = vo.getM_id();
		
		String name = request.getParameter("name");
		String mate = request.getParameter("mate");
		
		Mate mateVO = new Mate(mate, id, name);
		MateDAO dao = new MateDAO();
		int cnt = dao.insertMate(mateVO);
		
		if(cnt>0) {
			System.out.println("작성성공");
			response.sendRedirect("schoolmateList.jsp");
		}else {
			System.out.println("작성실패");
			response.sendRedirect("MateWrite.jsp");
		}
	}

}
