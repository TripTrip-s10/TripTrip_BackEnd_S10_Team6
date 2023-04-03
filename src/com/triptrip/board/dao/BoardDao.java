package com.triptrip.board.dao;

import java.sql.SQLException;
import java.util.List;

import com.triptrip.board.dto.Board;

public interface BoardDao {
	void write(Board board)throws SQLException;

	void update(Board board)throws SQLException;

	void delete(int boardId)throws SQLException;

	List<Board> listArticle()throws SQLException;

	Board getArticle(int boardId)throws SQLException;
}
