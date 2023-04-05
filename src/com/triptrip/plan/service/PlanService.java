package com.triptrip.plan.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.dto.PlanDto;

public interface PlanService {
	List<MapDto> keywordList(String keyword) throws Exception;
	int addPlan(PlanDto planDto) throws Exception;
	void addPlanPlace(ArrayList[] planPlaceList) throws SQLException;
}
