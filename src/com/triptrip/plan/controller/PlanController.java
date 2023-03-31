package com.triptrip.plan.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.util.Arrays;

import com.google.gson.Gson;
import com.triptrip.map.dto.MapDto;
import com.triptrip.map.service.MapService;
import com.triptrip.map.service.MapServiceImpl;
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
		}
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
