package com.smhrd.controll;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Police;
import com.smhrd.model.PoliceDAO;

public class insertP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name= request.getParameter("name");
		String addr= request.getParameter("addr");
		double lat1= Double.parseDouble(request.getParameter("lat"));
		double lon1= Double.parseDouble(request.getParameter("lon"));
		
		BigDecimal lat = BigDecimal.valueOf(lat1);
		BigDecimal lon = BigDecimal.valueOf(lon1);
		String tel= request.getParameter("tel");
		
		Police vo = new Police(name, addr, lat, lon, tel);
		PoliceDAO dao = new PoliceDAO();
		
		int cnt = dao.insertP(vo);
		
		if(cnt>0) {
			System.out.println("등록 성공");
			response.sendRedirect("selectPolice.jsp");
		}else {
			System.out.println("등록 실패");
			response.sendRedirect("insertP.jsp");
		}
	}

}
