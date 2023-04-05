package com.triptrip.plan.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.dao.PlanDao;
import com.triptrip.plan.dao.PlanDaoImpl;
import com.triptrip.plan.dto.PlanDto;

public class PlanServiceImpl implements PlanService {
	private static PlanService planService = new PlanServiceImpl();
	private PlanDao planDao;
	
	private PlanServiceImpl() {
		planDao = PlanDaoImpl.getPlanDao();
	}
	public static PlanService getPlanService() {
		return planService;
	}
	@Override
	public List<MapDto> keywordList(String keyword) throws Exception {
		return planDao.keywordList(keyword);
	}
	@Override
	public int addPlan(PlanDto planDto) throws Exception {
		return planDao.addPlan(planDto);
	}
	
	@Override
	public void addPlanPlace(ArrayList[] planPlaceList) throws SQLException {
		System.out.println(Arrays.deepToString(planPlaceList));
		planDao.addPlanPlace(planPlaceList);
	}

}
