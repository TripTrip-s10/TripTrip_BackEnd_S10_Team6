package com.triptrip.plan.service;

import java.util.List;

import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.dao.PlanDao;
import com.triptrip.plan.dao.PlanDaoImpl;

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

}
