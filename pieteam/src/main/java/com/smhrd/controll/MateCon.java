package com.smhrd.controll;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Mate;
import com.smhrd.model.MateDAO;

public class MateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String matenum = request.getParameter("matenum");
		BigDecimal mate_seq = new BigDecimal(matenum); // String to BigDecimal
		
		String mate_id = request.getParameter("mate_id");
		
		System.out.println(mate_seq);
		System.out.println(mate_id);
		
		Mate mateVO = new Mate(mate_seq, mate_id);
		
		MateDAO dao = new MateDAO();
		int cnt = dao.updateMate(mateVO);
		
		response.setCharacterEncoding("UTF-8"); // 응답데이터인코딩
		PrintWriter out = response.getWriter();
		
		if(cnt>0) { // 댓글작성 성공
			out.print("메이트 등록 성공하였습니다.");
			System.out.println("메이트 등록 성공");
		}else { // 댓글작성 실패
			out.print("메이트 등록 실패하였습니다.");
			System.out.println("메이트 등록 실패");
		}
	}

}
