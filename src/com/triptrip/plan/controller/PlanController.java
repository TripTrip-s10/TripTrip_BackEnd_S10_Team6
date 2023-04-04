package com.triptrip.plan.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.service.PlanService;
import com.triptrip.plan.service.PlanServiceImpl;

@WebServlet("/plan")
public class PlanController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PlanService planService;

	private Gson gson = new Gson();

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		planService = PlanServiceImpl.getPlanService();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action = " + action);
		if ("keywordList".equals(action)) {
			keywordList(request, response);
		}else if("planList".equals(action)) {
			try {
				planList(request,response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private void planList(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
		String body = getBody(request);
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject)parser.parse(body);
		System.out.println(jsonObject.get("plans"));
	}

	private String getBody(HttpServletRequest request) throws IOException{
		String body = null;
		StringBuilder sb = new StringBuilder();
		BufferedReader br = null;
		try {
			InputStream inputStream = request.getInputStream();
			if(inputStream	!= null) {
				br = new BufferedReader(new InputStreamReader(inputStream));
				char[] charBuffer = new char[128];
				int bytesRead = -1;
				while((bytesRead = br.read(charBuffer))>0) {
					sb.append(charBuffer,0,bytesRead);
				}
			}
		}catch(IOException e) {
			throw e;
		}finally {
			if(br != null) {
				try {
					br.close();
				}catch(IOException e) {
					throw e;
				}
			}
		}
		body = sb.toString();
		return body;
	}

	private String keywordList(HttpServletRequest request, HttpServletResponse response) {
		String keyword = request.getParameter("keyword");
		System.out.println("keyword = " + keyword);
		try {
			List<MapDto> list = planService.keywordList(keyword);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(gson.toJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

}
