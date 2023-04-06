package com.triptrip.map.service;

import com.triptrip.map.dao.MapDaoImpl;
import com.triptrip.map.dto.MapDto;

import java.util.List;
import java.util.Map;

import com.triptrip.map.dao.MapDao;

public class MapServiceImpl implements MapService {
	private static MapService mapService = new MapServiceImpl();
	private MapDao mapDao;
	
	private MapServiceImpl() {
		mapDao = MapDaoImpl.getMapDao();
	}

	public static MapService getMapService() {
		return mapService;
	}

	@Override
	public List<MapDto> list(Map<String, String> map) throws Exception{
		return mapDao.list(map);
	}

}
