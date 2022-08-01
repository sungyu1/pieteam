package com.smhrd.controll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;

public class DeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		
		// DAO -> deleteMember() 매개변수, 반환타입
		MemberDAO dao = new MemberDAO();
		int cnt = dao.deleteMember(id);

		// mapper sql 작성
		
		// 삭제성공 : 콘솔 "삭제성공"
		// 삭제실패 : 콘솔 "삭제실패"
		// -> select.jsp 이동
		if(cnt>0) { // 삭제 성공
			System.out.println("삭제 성공");
		}else { // 삭제 실패
			System.out.println("삭제 실패");
		}
		response.sendRedirect("selectMember.jsp");
	}

}
