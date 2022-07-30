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
import com.smhrd.model.CCTV;
import com.smhrd.model.CCTVDAO;


public class cctvListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		CCTVDAO dao = new CCTVDAO();
		List<CCTV> list = dao.selectcctvList(num);
		
		JsonObject json = new JsonObject(); // json 객체
		JsonArray jarray = new JsonArray(); // json array
		
		for(CCTV c : list) {
			json.addProperty("num", c.getCctv_seq());
			json.addProperty("name", c.getCctv_name());
			json.addProperty("addr", c.getCctv_addr());
			json.addProperty("lat", c.getCctv_lat());
			json.addProperty("lon", c.getCctv_lon());
			json.addProperty("tel", c.getCctv_tel());
			json.addProperty("ad_id", c.getAdmin_id());
			
			jarray.add(json);
			json = new JsonObject();
			
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jarray);
	}

}