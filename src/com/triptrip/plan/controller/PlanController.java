package com.triptrip.plan.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.triptrip.board.dto.Board;
import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.dto.PlanDto;
import com.triptrip.plan.dto.PlanPlaceDto;
import com.triptrip.plan.service.PlanService;
import com.triptrip.plan.service.PlanServiceImpl;
import com.triptrip.user.dto.User;

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
		String path = "";
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
		} else if("view".equals(action)) {
			path = view(request, response);
			forward(request, response, path);
		}
	}
	
	private void planList(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException{
		String body = getBody(request);
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject)parser.parse(body);
		// plan - 계획 
		PlanDto planDto = new PlanDto();
		planDto.setUserId(Integer.parseInt(jsonObject.get("userId").toString()));
		planDto.setTitle(jsonObject.get("title").toString());
		planDto.setStartDate((String) jsonObject.get("startDate"));
		planDto.setEndDate((String) jsonObject.get("endDate"));
		System.out.println(planDto);
		try {
			int planId = planService.addPlan(planDto);
			System.out.println("planId = " + planId);
			
			// planPlace - 일자별
			JSONObject plans = (JSONObject) jsonObject.get("plans");
			Iterator<String> keys = plans.keySet().iterator();
			ArrayList[] planPlaceList = new ArrayList[plans.size()];
			System.out.println(plans.size());
			String key = "";
			for(int i = 0; i < plans.size(); i++) {
				key = keys.next();
				JSONArray planArr = (JSONArray) plans.get(key);
				System.out.println(planArr);
				planPlaceList[i] = new ArrayList<PlanPlaceDto>();
				for(int j = 0; j < planArr.size(); j++) {
					JSONObject place = (JSONObject)planArr.get(j);
					PlanPlaceDto planPlaceDto = new PlanPlaceDto();
					planPlaceDto.setPlanId(planId);
					planPlaceDto.setDay(Integer.parseInt(key));
					planPlaceDto.setContentId(Integer.parseInt(place.get("contentId").toString()));
					planPlaceList[i].add(planPlaceDto);
				}
			}
			planService.addPlanPlace(planPlaceList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
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
	private String view(HttpServletRequest request, HttpServletResponse response) {
		int planId = Integer.parseInt(request.getParameter("planNo"));
		System.out.println("planID = " + planId);
		try {
			PlanDto plan = planService.getPlan(planId);
			System.out.println(plan.toString());
			request.setAttribute("plan", plan);
			Map<Integer,List<MapDto>> placeList = planService.getPlanPlace(planId);
			request.setAttribute("places", placeList);
			return "/plan/view.jsp";
		} catch (Exception e) {
			System.out.println(e);
			return "/error/error.jsp";
		}
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
