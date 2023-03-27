package com.triptrip.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			}

		} finally {
			dbUtil.close(pstmt, conn);
		}
		return user;
	}

	@Override
	public void modifyInfo(User user) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update user \n").append("set name = ? \n").append("where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, user.getName());
			pstmt.setInt(2, user.getId());
			pstmt.executeUpdate();

		} finally {
			dbUtil.close(pstmt, conn);
		}
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
		}finally {
			dbUtil.close(pstmt, conn);
		}
	}
}
