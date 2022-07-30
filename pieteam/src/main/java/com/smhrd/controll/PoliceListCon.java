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
import com.smhrd.model.Police;
import com.smhrd.model.PoliceDAO;

public class PoliceListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		PoliceDAO dao = new PoliceDAO();
		List<Police> list = dao.selectPoliceList(num);
		
		JsonObject json = new JsonObject(); // json 객체
		JsonArray jarray = new JsonArray(); // json array
		
		for(Police p : list) {
			json.addProperty("num", p.getP_seq());
			json.addProperty("name", p.getP_name());
			json.addProperty("addr", p.getP_addr());
			json.addProperty("lat", p.getP_lat());
			json.addProperty("lon", p.getP_lon());
			json.addProperty("tel", p.getP_tel());
			json.addProperty("ad_id", p.getAdmin_id());
			
			jarray.add(json);
			json = new JsonObject();
			
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jarray);
	}

}
