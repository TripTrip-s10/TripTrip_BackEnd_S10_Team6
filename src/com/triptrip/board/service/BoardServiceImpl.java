package com.triptrip.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.triptrip.board.dao.BoardDao;
import com.triptrip.board.dao.BoardDaoImpl;
import com.triptrip.board.dto.Board;
import com.triptrip.util.BoardSize;
import com.triptrip.util.PageNavigation;
import com.triptrip.util.SizeConstant;

public class BoardServiceImpl implements BoardService {
	private static BoardService boardService = new BoardServiceImpl();
	private BoardDao boardDao;

	private BoardServiceImpl() {
		boardDao = BoardDaoImpl.getBoardDao();
	}

	public static BoardService getService() {
		return boardService;
	}

	@Override
	public void write(Board board) throws SQLException {
		boardDao.createArticle(board);
	}

	@Override
	public List<Board> getArticles() throws SQLException {
		return boardDao.getArticles(BoardSize.ALL_CONTENT);
	}

	@Override
	public List<Board> getArticlesLimit() throws SQLException {
		return boardDao.getArticles(BoardSize.LIMIT_CONTENT);
	}

	@Override
	public Board getArticle(int boardId) throws SQLException {
		return boardDao.getArticle(boardId);
	}

	@Override
	public void update(Board board) throws SQLException {
		boardDao.updateArticle(board);
	}

	@Override
	public void delete(int boardId) throws SQLException {
		boardDao.deleteArticle(boardId);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {

		PageNavigation pageNavigation = new PageNavigation();

		int naviSize = SizeConstant.NAVIGATION_SIZE;
		int sizePerPage = SizeConstant.LIST_SIZE;
		int currentPage = Integer.parseInt(map.get("pgno"));

		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		Map<String, Object> param = new HashMap<String, Object>();

		int totalCount = boardDao.getTotalArticleCount(param);
		pageNavigation.setTotalCount(totalCount);

		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);

		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);

		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();

		return pageNavigation;
	}

}
