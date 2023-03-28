package com.triptrip.map.controller;

import java.io.IOException;
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

import com.triptrip.util.ParameterCheck;
import com.triptrip.map.dto.MapDto;
import com.triptrip.map.service.MapService;
import com.triptrip.map.service.MapServiceImpl;

@WebServlet("/map")
public class MapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String areaCode;
	private String categoryCode;
	private String queryString;
	
	private MapService mapService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		mapService = MapServiceImpl.getMapService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		areaCode = ParameterCheck.nullToBlank(request.getParameter("areaCode"));
		categoryCode = ParameterCheck.nullToBlank(request.getParameter("categoryCode"));
		queryString = "?areaCode=" +areaCode + "&categoryCode=" + categoryCode;
		String path = "";
		
		if("list".equals(action)) {
			path = list(request,response);
			System.out.println(path);
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

	
	private String list(HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String,String> map = new HashMap<String, String>();
			map.put("areaCode", areaCode);
			map.put("categoryCode",categoryCode);
			List<MapDto> mapList = mapService.list(map); // 글 목록 
			request.setAttribute("mapList", mapList);
			return "/map/list.jsp" + queryString;
		} catch (Exception e) {
			return "/error/error.jsp";
		}
	}

}
