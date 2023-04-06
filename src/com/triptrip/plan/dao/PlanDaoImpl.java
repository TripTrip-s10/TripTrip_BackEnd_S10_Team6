package com.triptrip.plan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.cj.PingTarget;
import com.triptrip.map.dao.MapDaoImpl;
import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.dto.PlanDto;
import com.triptrip.plan.dto.PlanPlaceDto;
import com.triptrip.util.DBUtil;

public class PlanDaoImpl implements PlanDao {
	private static PlanDao planDao;
	private DBUtil dbUtil;

	private PlanDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static PlanDao getPlanDao() {
		if (planDao == null)
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
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MapDto mapDto = new MapDto();
				mapDto.setContentId(rs.getString("content_id"));
				mapDto.setTitle(rs.getString("title"));
				mapDto.setAddr(rs.getString("addr1"));
				mapDto.setImageUrl(rs.getString("first_image"));
				mapDto.setLat(rs.getDouble("latitude"));
				mapDto.setLng(rs.getDouble("longitude"));
				list.add(mapDto);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
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
			sql.append("insert into plan_list(plan_id,user_id,title,start_date,end_date)\n");
			sql.append("values (?,?,?,?,?)\n");
			pstmt = conn.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, planDto.getUserId());
			pstmt.setString(3, planDto.getTitle());
			pstmt.setString(4, planDto.getStartDate());
			pstmt.setString(5, planDto.getEndDate());
			pstmt.executeUpdate();

			rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				planId = rs.getInt(1);
			}
		} finally {
			dbUtil.close(pstmt, conn);
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
			sql = new StringBuilder();
			sql.append("insert into plan_place(plan_id, day, content_id,createAt,updateAt)\n values");
			for (int i = 0; i < planPlaceList.length; i++) {
				if (planPlaceList.length - 1 == i) {
					for (int j = 0; j < planPlaceList[i].size(); j++) {
						if (planPlaceList[i].size() - 1 == j) {
							sql.append("(?,?,?,?,?);");
						} else {
							sql.append("(?,?,?,?,?),\n");
						}
					}
				} else {
					for (int j = 0; j < planPlaceList[i].size(); j++) {
						sql.append("(?,?,?,?,?),\n");
					}
				}
			}
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 1;
			for (ArrayList placeList : planPlaceList) {
				for (int i = 0; i < placeList.size(); i++) {
					PlanPlaceDto planPlaceDto = (PlanPlaceDto) placeList.get(i);
					pstmt.setInt(idx++, planPlaceDto.getPlanId());
					pstmt.setInt(idx++, planPlaceDto.getDay());
					pstmt.setInt(idx++, planPlaceDto.getContentId());
					pstmt.setTimestamp(idx++, Timestamp.valueOf(LocalDateTime.now()));
					pstmt.setTimestamp(idx++, Timestamp.valueOf(LocalDateTime.now()));
				}
			}
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public PlanDto getPlan(int planId) throws SQLException {
		PlanDto planDto = new PlanDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select plan_id, user_id, title, start_date, end_date\n");
			sql.append("from plan_list\n");
			sql.append("where plan_id = ?\n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, planId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				planDto.setPlanId(planId);
				planDto.setUserId(rs.getInt("user_id"));
				planDto.setTitle(rs.getString("title"));
				planDto.setStartDate(rs.getDate("start_date").toString());
				planDto.setEndDate(rs.getDate("end_date").toString());
			}
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return planDto;
	}

	@Override
	public Map<Integer, List<MapDto>> getPlanPlace(int planId) throws SQLException{
		Map<Integer,List<MapDto>> placeList = new HashMap<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select plan_placeid, day, plan_place.content_id, title, addr1,first_image, latitude, longitude\n");
			sql.append("from plan_place\n");
			sql.append("inner join attraction_info\n");
			sql.append("on plan_place.content_id = attraction_info.content_id\n");
			sql.append("where plan_place.plan_id = ?\n");
			sql.append("order by plan_place.plan_placeid;\n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, planId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int day = rs.getInt("day");
				if(!placeList.containsKey(day)) {
					placeList.put(day,new ArrayList<MapDto>());
				}
				MapDto mapDto = new MapDto();
				mapDto.setContentId(rs.getString("plan_place.content_id"));
				mapDto.setTitle(rs.getString("title"));
				mapDto.setAddr(rs.getString("addr1"));
				mapDto.setImageUrl(rs.getString("first_image"));
				mapDto.setLat(rs.getDouble("latitude"));
				mapDto.setLng(rs.getDouble("longitude"));
				placeList.get(day).add(mapDto);
				
			}
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return placeList;
	}
}
