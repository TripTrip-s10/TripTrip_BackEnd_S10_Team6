package com.triptrip.plan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.triptrip.map.dao.MapDaoImpl;
import com.triptrip.map.dto.MapDto;
import com.triptrip.util.DBUtil;

public class PlanDaoImpl implements PlanDao{
	private static PlanDao planDao;
	private DBUtil dbUtil;
	
	private PlanDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}
	public static PlanDao getPlanDao() {
		if(planDao == null)
			planDao = new PlanDaoImpl();
		return planDao;
	}
	@Override
	public List<MapDto> keywordList(String keyword) throws SQLException {
		List<MapDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select content_id, title, addr1,first_image,latitude,longitude\n");
			sql.append("from attraction_info\n");
			sql.append("where content_id like ? or addr1 like ?\n");
			sql.append("limit 100");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + keyword  +"%");
			pstmt.setString(2, "%" + keyword  +"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MapDto mapDto = new MapDto();
				mapDto.setContentId(rs.getString("content_id"));
				mapDto.setTitle(rs.getString("title"));
				mapDto.setAddr(rs.getString("addr1"));
				mapDto.setImageUrl(rs.getString("first_image"));
				mapDto.setLat(rs.getDouble("latitude"));
				mapDto.setLng(rs.getDouble("longitude"));
				list.add(mapDto);
			}
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return list;
	}
}
