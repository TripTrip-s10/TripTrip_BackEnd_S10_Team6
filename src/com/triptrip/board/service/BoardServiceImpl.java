package com.triptrip.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.triptrip.board.dao.BoardDao;
import com.triptrip.board.dao.BoardDaoImpl;
import com.triptrip.board.dto.Board;
import com.triptrip.util.PageNavigation;
import com.triptrip.util.SizeConstant;

public class BoardServiceImpl implements BoardService {
	private static BoardService boardService = new BoardServiceImpl();
	private BoardDao boardDao;

	private BoardServiceImpl() {
		boardDao = BoardDaoImpl.getBoardDao();
	}

	public static BoardService getService() {
		// TODO Auto-generated method stub
		return boardService;
	}

	@Override
	public void write(Board board) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Board board) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int boardId) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Board> listArticle() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board getArticle(int boardId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
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
