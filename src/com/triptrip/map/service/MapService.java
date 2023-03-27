package com.triptrip.map.service;

import java.util.List;
import java.util.Map;

import com.triptrip.map.dto.MapDto;

public interface MapService {

	List<MapDto> listAll(Map<String, Integer> map) throws Exception;
	
}
