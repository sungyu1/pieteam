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
import com.smhrd.model.Fire;
import com.smhrd.model.FireDAO;
import com.smhrd.model.Safe;
import com.smhrd.model.SafeDAO;


public class SafeListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int num = Integer.parseInt(request.getParameter("num"));
		
		SafeDAO dao = new SafeDAO();
		List<Safe> list = dao.selectSafeList(num);
		
		JsonObject json = new JsonObject(); // json 객체
		JsonArray jarray = new JsonArray(); // json array
		
		for(Safe s : list) {
			json.addProperty("num", s.getSz_seq());
			json.addProperty("addr", s.getSz_addr());
			json.addProperty("lat", s.getSz_lat());
			json.addProperty("lon", s.getSz_lon());
			json.addProperty("ad_id", s.getAdmin_id());
			
			jarray.add(json);
			json = new JsonObject();
			
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jarray);
	}

}