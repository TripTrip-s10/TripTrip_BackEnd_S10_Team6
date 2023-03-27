package com.triptrip.map.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.triptrip.map.dto.MapDto;
import com.triptrip.map.service.MapService;
import com.triptrip.map.service.MapServiceImpl;

@WebServlet("/map")
public class MapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int areaCode;
	private int categoryCode;
	
	private MapService mapService;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		mapService = MapServiceImpl.getMapService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		areaCode = Integer.parseInt(request.getParameter("areaCode"));
		System.out.println("areaCode = " + areaCode);
		String path = "";
		if(action.equals("listAll")) {
			path = listAll(request,response);
			categoryCode = 0;
			forward(request,response,path);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	private String listAll(HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String,Integer> map = new HashMap<String, Integer>();
			map.put("areaCode", areaCode);
			map.put("categoryCode",categoryCode);

			List<MapDto> list = mapService.listAll(map); // 글 목록 
			request.setAttribute("lists", list);
			return "/map/list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "글목록 출력 중 문제 발생!!!");
			return "/error/error.jsp";
		}
	}

}
