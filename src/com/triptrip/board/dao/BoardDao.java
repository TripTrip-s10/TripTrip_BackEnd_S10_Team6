package com.triptrip.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.triptrip.board.dto.Board;

public interface BoardDao {
	void createArticle(Board board) throws SQLException;

	List<Board> getArticles(int num) throws SQLException;

	Board getArticle(int boardId) throws SQLException;

	void updateArticle(Board board) throws SQLException;

	void deleteArticle(int boardId) throws SQLException;

	int getTotalArticleCount(Map<String, Object> param) throws SQLException;
}
