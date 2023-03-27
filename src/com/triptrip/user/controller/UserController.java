package com.triptrip.user.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.triptrip.user.dto.User;
import com.triptrip.user.service.UserService;
import com.triptrip.user.service.UserServiceImpl;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService;

	public void init() {
		userService = UserServiceImpl.getUserService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		String path = "";
		if ("mvjoin".equals(action)) {
			path = "/user/join.jsp";
			redirect(request, response, path);
		} else if ("join".equals(action)) {
			path = join(request, response);
			redirect(request, response, path);
		} else if ("login".equals(action)) {
			System.out.println("plz");
			path = login(request, response);
			forward(request, response, path);
		} else if ("logout".equals(action)) {
			path = logout(request, response);
			redirect(request, response, path);
		} else if ("withdraw".equals(action)) {
			path = withdraw(request, response);
			redirect(request, response, path);
		} else {
			redirect(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private String join(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		user.setName(request.getParameter("name"));
		user.setAuth_id(request.getParameter("auth_id"));
		user.setAuth_pw(request.getParameter("auth_pw"));

		try {
			userService.join(user);
			return "/user/login.jsp";
		} catch (SQLException e) {
			return "/error/error.jsp";
		}
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userid");
		String userPwd = request.getParameter("userpwd");
		try {
			User user = userService.login(userId, userPwd);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", user);

				String idsave = request.getParameter("saveid");
				if ("ok".equals(idsave)) {
					Cookie cookie = new Cookie("ssafy_id", userId);
					cookie.setPath(request.getContextPath());
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40); // 40년간 저장.
					response.addCookie(cookie);
				} else {
					Cookie cookies[] = request.getCookies();
					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if ("ssafy_id".equals(cookie.getName())) {
								cookie.setMaxAge(0);
								response.addCookie(cookie);
								break;
							}
						}
					}
				}
				return "/index.jsp";
			} else {
				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요.");
				return "/user/login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "로그인 중 에러 발생!!!");
			return "/error/error.jsp";
		}
	}

	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "";
	}

	private String withdraw(HttpServletRequest request, HttpServletResponse response) {
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		try {
			userService.withdraw(user_id);
			return "/index.jsp";
		} catch (SQLException e) {
			e.printStackTrace();
			return "/error/error.jsp";
		}
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

}
