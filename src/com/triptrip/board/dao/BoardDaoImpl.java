package com.triptrip.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
			sql.append("insert into board (user_id, subject, content) \n");
			sql.append("values (?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board.getUserId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}

	}

	@Override
	public void update(Board board) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update board \n").append("set title = ?, content = ? \n").append("where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getId());
			pstmt.executeUpdate();

		} finally {
			dbUtil.close(pstmt, conn);
		}

	}

	@Override
	public void delete(int boardId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from board \n").append("where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardId);
			pstmt.executeUpdate();

		} finally {
			dbUtil.close(pstmt, conn);
		}

	}

	@Override
	public List<Board> listArticle() throws SQLException {
		List<Board> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * \n").append("from board");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setId(rs.getInt("id"));
				board.setTitle(rs.getString("title"));
//				board.setContent(rs.getString("content"));
//				board.setImgSrc(rs.getString("imgSrc"));
				board.setUserId(rs.getInt("userId"));
				list.add(board);
			}
		} finally {
			dbUtil.close(pstmt, conn);
		}
		return null;
	}

	@Override
	public Board getArticle(int boardId) throws SQLException {
		Board board = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * from board \n").append("where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new Board();
				board.setId(rs.getInt("id"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setImgSrc(rs.getString("imgSrc"));
				board.setUserId(rs.getInt("userId"));
			}
		} finally {
			dbUtil.close(pstmt, conn);
		}
		return board;
	}

	@Override
	public int getTotalArticleCount(Map<String, Object> param) throws SQLException {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select count(article_no) \n");
			sql.append("from board \n");
//			String key = (String) param.get("key");
//			String word = (String) param.get("word");
//			if (!key.isEmpty() && !word.isEmpty()) {
//				if ("subject".equals(key)) {
//					sql.append("where subject like concat('%', ?, '%') \n");
//				} else {
//					sql.append("where ").append(key).append(" = ? \n");
//				}
//			}
			pstmt = conn.prepareStatement(sql.toString());
//			if (!key.isEmpty() && !word.isEmpty())
//				pstmt.setString(1, word);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return cnt;
	}

}
