package com.triptrip.map.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.triptrip.map.dto.MapDto;
import com.triptrip.util.DBUtil;

public class MapDaoImpl implements MapDao{
	private static MapDao MapDao;
	private DBUtil dbUtil;
	
	private MapDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static MapDao getMapDao() {
		if(MapDao == null)
			MapDao = new MapDaoImpl();
		return MapDao;
	}
	
	public List<MapDto> list(Map<String,String> map) throws SQLException{
		List<MapDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select title, addr1, first_image, latitude,longitude\n");
			sql.append("from attraction_info\n");
			sql.append("where sido_code = ? \n");
			if(!map.get("categoryCode").isEmpty()) {
				sql.append("and content_type_id = ?\n");
			}
			sql.append("limit 100\n");
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, map.get("areaCode"));
			if(!map.get("categoryCode").isEmpty()) {
				pstmt.setString(2, map.get("categoryCode"));
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MapDto mapDto = new MapDto();
				mapDto.setTitle(rs.getString("title"));
				mapDto.setAddr(rs.getString("addr1"));
				mapDto.setImageUrl(rs.getString("first_image"));
				mapDto.setLat(rs.getDouble("latitude"));
				mapDto.setLng(rs.getDouble("longitude"));
				list.add(mapDto);
			}
		} finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return list;
	}
}
