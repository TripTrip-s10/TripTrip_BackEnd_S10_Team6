package com.triptrip.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.triptrip.board.dto.Board;
import com.triptrip.board.service.BoardService;
import com.triptrip.board.service.BoardServiceImpl;
import com.triptrip.user.dto.User;
import com.triptrip.user.service.UserService;
import com.triptrip.user.service.UserServiceImpl;
import com.triptrip.util.PageNavigation;
import com.triptrip.util.ParameterCheck;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService;
	private UserService userService;

	public void init() {
		boardService = BoardServiceImpl.getService();
		userService = UserServiceImpl.getUserService();
	}

	private int pgno;
	private String queryStrig;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String path = "";

		pgno = ParameterCheck.notNumberToOne(request.getParameter("pgno"));
		queryStrig = "?pgno=" + pgno;

		
		if ("mvwrite".equals(action)) {
			path = "/board/write.jsp";
			redirect(request, response, path);
		} else if ("write".equals(action)) {
			path = write(request, response);
			redirect(request, response, path);
		} else if ("view".equals(action)) {
			path = view(request, response);
			forward(request, response, path);
		} else if ("list".equals(action)) {
			System.out.println("??");
			path = viewList(request, response);
			forward(request, response, path);
		} else if ("mvupdate".equals(action)) {
			path = mvupdate(request, response);
			redirect(request, response, path);
		} else if ("update".equals(action)) {
			path = update(request, response);
			redirect(request, response, path);
		} else if ("delete".equals(action)) {
			path = delete(request, response);
			redirect(request, response, path);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

	private String write(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userinfo");
		System.out.println("????");
		if (user != null) {
			Board board = new Board();
			board.setUserId(user.getId());
			board.setTitle(request.getParameter("title"));
			board.setContent(request.getParameter("content"));
			System.out.println(board.toString());
			try {
				boardService.write(board);
				return "/board?action=list";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "글작성 중 문제 발생!!!");
				return "/error/error.jsp";
			}
		} else
			return "/user/login.jsp";
	}

	private String view(HttpServletRequest request, HttpServletResponse response) {
		int articleId = Integer.parseInt(request.getParameter("articleno"));
		try {
			Board article = boardService.getArticle(articleId);
			System.out.println("view:"+article.toString());
			request.setAttribute("article", article);
			
			int userId = article.getUserId();
			User writer = userService.findById(userId);
			request.setAttribute("writer", writer);
			return "/board/article.jsp";
		} catch (Exception e) {
			System.out.println(e);
			return "/error/error.jsp";
		}
	}

	private String viewList(HttpServletRequest request, HttpServletResponse response) {
		try {
//			Map<String, String> map = new HashMap<String, String>();
//			map.put("pgno", pgno + "");
//
//			PageNavigation pageNavigation = boardService.makePageNavigation(map);
//			request.setAttribute("navigation", pageNavigation);

			List<Board> list = boardService.listArticle();
			request.setAttribute("articles", list);
			return "/board/board.jsp";
		} catch (Exception e) {
			return "/error/error.jsp";
		}
	}

	private String mvupdate(HttpServletRequest request, HttpServletResponse response) {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		try {
			Board article = boardService.getArticle(boardId);
			request.setAttribute("article", article);
			return "/board/update.jsp";
		} catch (Exception e) {
			return "/error/error.jsp";
		}
	}

	private String update(HttpServletRequest request, HttpServletResponse response) {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		try {
			Board article = boardService.getArticle(boardId);
			article.setTitle(boardTitle);
			article.setContent(boardContent);

			boardService.update(article);

			return "/article?action=view&boardId=" + boardId;
		} catch (Exception e) {
			return "/error/error.jsp";
		}
	}

	private String delete(HttpServletRequest request, HttpServletResponse response) {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		try {
			boardService.delete(boardId);
			return "/board/list.jsp";
		} catch (Exception e) {
			return "/error/error.jsp";
		}
	}
}
