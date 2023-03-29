package com.triptrip.map.service;

import com.triptrip.map.dao.MapDaoImpl;
import com.triptrip.map.dto.MapDto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.triptrip.map.dao.MapDao;

public class MapServiceImpl implements MapService {
	private static MapService MapService = new MapServiceImpl();
	private MapDao MapDao;
	
	private MapServiceImpl() {
		MapDao = MapDaoImpl.getMapDao();
	}

	public static MapService getMapService() {
		return MapService;
	}

	@Override
	public List<MapDto> list(Map<String, String> map) throws Exception{
		return MapDao.list(map);
	}

}
