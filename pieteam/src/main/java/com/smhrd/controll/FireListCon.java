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


public class FireListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int num = Integer.parseInt(request.getParameter("num"));
		
		FireDAO dao = new FireDAO();
		List<Fire> list = dao.selectFireList(num);
		
		JsonObject json = new JsonObject(); // json 객체
		JsonArray jarray = new JsonArray(); // json array
		
		for(Fire f : list) {
			json.addProperty("num", f.getF_seq());
			json.addProperty("name", f.getF_name());
			json.addProperty("addr", f.getF_addr());
			json.addProperty("lat", f.getF_lat());
			json.addProperty("lon", f.getF_lon());
			json.addProperty("tel", f.getF_tel());
			json.addProperty("ad_id", f.getAdmin_id());
			
			jarray.add(json);
			json = new JsonObject();
			
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jarray);
	}

}