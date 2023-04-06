package com.triptrip.plan.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.dto.PlanDto;
import com.triptrip.plan.dto.PlanPlaceDto;

public interface PlanDao {
	List<MapDto> keywordList(String keyword) throws SQLException;
	int addPlan(PlanDto planDto) throws SQLException;
	void addPlanPlace(ArrayList[] planPlaceList) throws SQLException;
	PlanDto getPlan(int planId) throws SQLException;
	Map<Integer, List<MapDto>> getPlanPlace(int planId) throws SQLException;
}