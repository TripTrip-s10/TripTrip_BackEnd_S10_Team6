package com.triptrip.plan.dao;

import java.sql.SQLException;
import java.util.List;

import com.triptrip.map.dto.MapDto;

public interface PlanDao {
	List<MapDto> keywordList(String keyword) throws SQLException;
}
