package com.triptrip.map.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.triptrip.map.dto.MapDto;

public interface MapDao {

	List<MapDto> listAll(Map<String, Integer> map) throws SQLException;

}
