package com.smhrd.controll;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.Mate;
import com.smhrd.model.MateDAO;

public class MateListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int num = Integer.parseInt(request.getParameter("num"));
		
		MateDAO dao = new MateDAO();
		List<Mate> list = dao.selectMateList(num);
		
		JsonObject json = new JsonObject(); // json 객체
		JsonArray jarray = new JsonArray(); // json array
		
		for(Mate ma : list) {
			json.addProperty("num", ma.getMate_seq());
			json.addProperty("name", ma.getMate_name());
			json.addProperty("content", ma.getMate_memo());
			json.addProperty("date", ma.getMate_date().toString());
			json.addProperty("mate", ma.getMate_id());
			json.addProperty("writer", ma.getM_id());
			
			jarray.add(json);
			json = new JsonObject();
			
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jarray);
	}

}
