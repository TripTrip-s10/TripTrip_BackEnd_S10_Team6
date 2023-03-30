package com.triptrip.user.dao;

import java.sql.SQLException;

import com.triptrip.user.dto.User;

public interface UserDao {
	void join(User user) throws SQLException;

	User login(String auth_id, String auth_pw) throws SQLException;

	void withdraw(int user_id) throws SQLException;

	void modifyInfo(int userPk, String userName, String userMsg) throws SQLException;

	void modifyName(int userPk, String userName) throws SQLException;

	void modifyMsg(int userPk, String userMsg) throws SQLException;

	User findById(int userPk) throws SQLException;
}
