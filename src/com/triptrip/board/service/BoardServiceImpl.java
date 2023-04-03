package com.triptrip.board.service;

import java.sql.SQLException;
import java.util.List;

import com.triptrip.board.dao.BoardDao;
import com.triptrip.board.dao.BoardDaoImpl;
import com.triptrip.board.dto.Board;

public class BoardServiceImpl implements BoardService {
	private static BoardService boardService = new BoardServiceImpl();
	private BoardDao boardDao;

	private BoardServiceImpl() {
		boardDao = BoardDaoImpl.getBoardDao();
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

}
