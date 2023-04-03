package com.triptrip.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.triptrip.board.dto.Board;
import com.triptrip.util.DBUtil;

public class BoardDaoImpl implements BoardDao {

	private static BoardDao boardDao;
	private DBUtil dbUtil;

	private BoardDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static BoardDao getBoardDao() {
		if (boardDao == null)
			boardDao = new BoardDaoImpl();
		return boardDao;
	}

	@Override
	public void write(Board board) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			pstmt = conn.prepareStatement(sql.toString());
			
		} finally {
			dbUtil.close(pstmt,conn);
		}

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
