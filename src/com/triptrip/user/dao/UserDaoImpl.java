package com.triptrip.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.triptrip.plan.dto.PlanDto;
import com.triptrip.user.dto.User;
import com.triptrip.util.DBUtil;

public class UserDaoImpl implements UserDao {
	private static UserDao userDao = new UserDaoImpl();
	private DBUtil dbUtil;

	private UserDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static UserDao getUserDao() {
		return userDao;
	}

	@Override
	public void join(User user) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into user (name, auth_id, auth_pw)\n").append("values(?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getAuth_id());
			pstmt.setString(3, user.getAuth_pw());
			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public User login(String auth_id, String auth_pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		User user = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * from user \n ").append("where auth_id = ? and auth_pw = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, auth_id);
			pstmt.setString(2, auth_pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setAuth_id(rs.getString("auth_id"));
				user.setAuth_pw(rs.getString("auth_pw"));
				user.setMsg(rs.getString("msg"));
			}

		} finally {
			dbUtil.close(pstmt, conn);
		}
		return user;
	}

	@Override
	public void withdraw(int user_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from user \n").append("where user id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, user_id);
			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public void modifyInfo(int userPk, String userName, String userMsg) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update user \n").append("set name = ?, msg = ? \n").append("where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userName);
			pstmt.setString(2, userMsg);
			pstmt.setInt(3, userPk);
			pstmt.executeUpdate();

		} finally {
			dbUtil.close(pstmt, conn);
		}

	}

	@Override
	public void modifyName(int userPk, String userName) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update user \n").append("set name = ?\n").append("where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userName);
			pstmt.setInt(2, userPk);
			pstmt.executeUpdate();

		} finally {
			dbUtil.close(pstmt, conn);
		}

	}

	@Override
	public void modifyMsg(int userPk, String userMsg) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update user \n").append("set msg = ?\n").append("where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userMsg);
			pstmt.setInt(2, userPk);
			pstmt.executeUpdate();

		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public User findById(int userPk) throws SQLException {
		User user = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("selet * from user \n").append("where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, userPk);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setName(rs.getString("name"));
				user.setMsg(rs.getString("msg"));
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return user;
	}

	@Override
	public List<PlanDto> getPlanList(int userId) throws SQLException {
		List<PlanDto> planList = new ArrayList<PlanDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select plan_id, user_id, title, start_date, end_date\n");
			sql.append("from plan_list\n");
			sql.append("where user_id = ?\n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PlanDto planDto = new PlanDto();
				planDto.setUserId(userId);
				planDto.setPlanId(rs.getInt("plan_id"));
				planDto.setTitle(rs.getString("title"));
				planDto.setStartDate(rs.getString("start_date"));
				planDto.setEndDate(rs.getString("end_date"));				
				planList.add(planDto);
			}
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return planList;
	}

}
