package com.triptrip.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.triptrip.board.dto.Board;
import com.triptrip.util.PageNavigation;

public interface BoardService {
	void write(Board board) throws SQLException;

	void update(Board board) throws SQLException;

	void delete(int boardId) throws SQLException;

	List<Board> listArticle() throws SQLException;

	Board getArticle(int boardId) throws SQLException;
	
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
