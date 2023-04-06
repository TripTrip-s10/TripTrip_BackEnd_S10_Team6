package com.triptrip.user.service;

import java.sql.SQLException;
import java.util.List;

import com.triptrip.plan.dto.PlanDto;
import com.triptrip.user.dto.User;

public interface UserService {
	void join(User user) throws SQLException;
	User login(String auth_id, String auth_pw) throws SQLException;
	void withdraw(int user_id)throws SQLException;
	void modifyInfo(int userPk, String userName, String userMsg) throws SQLException;
	User findById(int userPk) throws SQLException;
	List<PlanDto> getPlanList(int userId) throws Exception;
}