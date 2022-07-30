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
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

public class ReviewListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		
		ReviewDAO dao = new ReviewDAO();
		List<Review> list = dao.selectReviewList(num);
		
		JsonObject json = new JsonObject(); // json 객체
		JsonArray jarray = new JsonArray(); // json array
		
		for(Review r : list) {
			json.addProperty("num", r.getR_seq());
			json.addProperty("name", r.getR_name());
			json.addProperty("writer", r.getM_id());
//			json.addProperty("views", r.);
			
			jarray.add(json);
			json = new JsonObject();
			
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jarray);
	}

}
