package com.triptrip.plan.service;

import java.util.List;

import com.triptrip.map.dto.MapDto;

public interface PlanService {
	List<MapDto> keywordList(String keyword) throws Exception;
}
