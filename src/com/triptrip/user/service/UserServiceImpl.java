package com.triptrip.user.service;

import java.sql.SQLException;

import com.triptrip.user.dao.UserDao;
import com.triptrip.user.dao.UserDaoImpl;
import com.triptrip.user.dto.User;

public class UserServiceImpl implements UserService {

	private static UserService userService = new UserServiceImpl();
	private UserDao userDao;

	private UserServiceImpl() {
		userDao = UserDaoImpl.getUserDao();
	}

	public static UserService getUserService() {
		return userService;
	}

	@Override
	public void join(User user) throws SQLException {
		userDao.join(user);
	}

	@Override
	public User login(String auth_id, String auth_pw) throws SQLException {
		return userDao.login(auth_id, auth_pw);
	}

	@Override
	public void withdraw(int user_id) throws SQLException {
		userDao.withdraw(user_id);
	}

	@Override
	public void modifyInfo(int userPk, String userName, String userMsg) throws SQLException {

		if (userName != null && userMsg != null)
			userDao.modifyInfo(userPk, userName, userMsg);
		else if (userMsg == null)
			userDao.modifyName(userPk, userName);
		else if (userName == null)
			userDao.modifyMsg(userPk, userMsg);
	}

	@Override
	public User findById(int userPk) throws SQLException {
		System.out.println(userPk);
		return userDao.findById(userPk);
	}
}
