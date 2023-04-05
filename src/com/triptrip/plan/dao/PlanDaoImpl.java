package com.triptrip.plan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.mysql.cj.PingTarget;
import com.triptrip.map.dao.MapDaoImpl;
import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.dto.PlanDto;
import com.triptrip.plan.dto.PlanPlaceDto;
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
	@Override
	public int addPlan(PlanDto planDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int planId = 0;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into plan_list(user_id,title,start_date,end_date)\n");
			sql.append("values (?,?,?,?)\n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, planDto.getUserId());
			pstmt.setString(2, planDto.getTitle());
			pstmt.setString(3, planDto.getStartDate());
			pstmt.setString(4, planDto.getEndDate());
			pstmt.executeUpdate();
			
			sql = new StringBuilder();
			sql.append("select plan_id\n");
			sql.append("from plan_list \n");
			sql.append("order by plan_id desc limit 1\n");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				planId = rs.getInt("plan_id");
			}
		}finally {
			dbUtil.close(pstmt,conn);
		}
		return planId;
	}
	@Override
	public void addPlanPlace(ArrayList[] planPlaceList) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = null;
		try {
			conn = dbUtil.getConnection();
			for(ArrayList placeList: planPlaceList) {
				for(int i = 0;i < placeList.size(); i++){
					PlanPlaceDto planPlaceDto = (PlanPlaceDto) placeList.get(i);
					sql = new StringBuilder();
					sql.append("insert into plan_place(plan_id,day, content_id)\n");
					sql.append("values (?,?,?)\n");
					pstmt = conn.prepareStatement(sql.toString());
					pstmt.setInt(1, planPlaceDto.getPlanId());
					pstmt.setInt(2, planPlaceDto.getDay());
					pstmt.setInt(3, planPlaceDto.getContentId());
					pstmt.executeUpdate();
				}
			}
		}finally {
			dbUtil.close(pstmt, conn);
		}
	}
}
