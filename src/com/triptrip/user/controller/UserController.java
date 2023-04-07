package com.triptrip.user.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.triptrip.map.dto.MapDto;
import com.triptrip.plan.dto.PlanDto;
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
			path = login(request, response);
			forward(request, response, path);
		} else if ("profile-update".equals(action)) {
			path = updateProfile(request, response);
			redirect(request, response, path);
		} else if ("logout".equals(action)) {
			System.out.println("logout");
			path = logout(request, response);
			redirect(request, response, path);
		} else if ("mvwithdraw".equals(action)) {
			path =  "/user/withdraw.jsp";
			redirect(request, response, path);
		} else if ("withdraw".equals(action)) {
			path = withdraw(request, response);
			redirect(request, response, path);
		} else if ("profile".equals(action)) {
			path = profile(request, response);
			System.out.println("path = " + path);
			forward(request, response, path);
		} else {
			redirect(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private String join(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		user.setName(request.getParameter("username"));
		user.setAuth_id(request.getParameter("userid"));
		user.setAuth_pw(request.getParameter("userpwd"));

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
				System.out.println(user);
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", user);

				String idsave = request.getParameter("saveid");
				if ("ok".equals(idsave)) {
					Cookie cookie = new Cookie("id", userId);
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

	private String updateProfile(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("username");
		String userMsg = request.getParameter("usermsg");
		int userPk = Integer.parseInt(request.getParameter("userpk"));
		System.out.println(userName + userMsg);
		try {
			userService.modifyInfo(userPk, userName, userMsg);
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("userinfo");
			System.out.println(userName + userMsg);
			if (userName != "")
				user.setName(userName);
			if (userMsg != "")
				user.setMsg(userMsg);
			return "/user?action=profile";
		} catch (SQLException e) {
			e.printStackTrace();
			return "/error/error.jsp";
		}
	}

	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "";
	}

	private String withdraw(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userid");
		String userPwd = request.getParameter("userpwd");
		try {
			User loginUser = userService.login(userId, userPwd);
			HttpSession session = request.getSession();
			User sessionUser = (User) session.getAttribute("userinfo");
			if (loginUser.getId() == sessionUser.getId()) {
				userService.withdraw(loginUser.getId());
				return "/index.jsp";
			} else {
				return "/user/withdraw.jsp";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return "/error/error.jsp";
		}
	}

	private String profile(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("userinfo");
			System.out.println(user.getId());
			List<PlanDto> plans = userService.getPlanList(user.getId());
			System.out.println(plans.toString());
			request.setAttribute("plans", plans);
			return "/user/profile.jsp";
		} catch (Exception e) {
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
