package com.smhrd.controll;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Mate;
import com.smhrd.model.MateDAO;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class MateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String matenum = request.getParameter("matenum");
		BigDecimal mate_seq = new BigDecimal(matenum); // String to BigDecimal
		
		String mate_id = request.getParameter("mate_id");
		
		System.out.println(mate_seq);
		System.out.println(mate_id);

		MemberDAO memberDAO = new MemberDAO();
		List<Member> member = memberDAO.selectAllMember();
		
		int cnt = 0;
		for(int i=0; i<member.size(); i++) {
			if(member.get(i).getM_id().equals(mate_id)) {
				Mate mateVO = new Mate(mate_seq, mate_id);
				
				MateDAO dao = new MateDAO();
				cnt = dao.updateMate(mateVO);
			}
		}
		
		
		
		response.setCharacterEncoding("UTF-8"); // 응답데이터인코딩
		PrintWriter out = response.getWriter();
		
		if(cnt>0) { // 댓글작성 성공
			out.print("success");
			System.out.println("success");
		}else { // 댓글작성 실패
			out.print("fail");
			System.out.println("fail");
		}
	}

}
