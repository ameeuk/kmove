package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.util.JdbcUtil;
import model.Board;
import model.BoardListView;

public class BoardDao {

	//전체 게시글 수 구함
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from board");
			rs.next();
			return rs.getInt(1);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
		}
	}
	
	
	
	public List<Board> selectList(Connection conn, int firstRow, int endRow) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement("select * from board order by id desc limit ?,?");
			pstmt.setInt(1, firstRow-1);
			pstmt.setInt(2, endRow-firstRow+1);
			rs = pstmt.executeQuery();
			if(!rs.next()){
				return Collections.emptyList();
			}
			List<Board> boardList = new ArrayList<Board>();
			do{
				Board board = makeBoardFromResultSet(rs);
				boardList.add(board);
			}while(rs.next());
			return boardList;
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		}
		
	}
	
	protected Board makeBoardFromResultSet(ResultSet rs)
			throws SQLException {
		Board board = new Board();
		board.setId(rs.getInt("id"));
		board.setWriter(rs.getString("writer"));
		board.setModel(rs.getString("model"));
		board.setCategory(rs.getString("category"));
		board.setTitle(rs.getString("title"));
		board.setContent(rs.getString("content"));
		board.setPostingDate(rs.getTimestamp("postingDate"));
		return board;
	}
	
	
	//전체 게시글을 해당 숫자 단위로 끊어서 각각 리스트로 저장
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	public BoardListView getBoardList(Connection conn, int pageNumber) throws Exception {
		int currentPageNumber = pageNumber;
		try {
			int boardTotalCount = selectCount(conn);

			List<Board> boardList = null;
			int firstRow = 0;
			int endRow = 0;
			if (boardTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				boardList = selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				boardList = Collections.emptyList();
			}
			return new BoardListView(boardTotalCount, currentPageNumber, boardList, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new Exception("Errors:" + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	
	//삽입
	public int insert(Connection conn, Board board) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into board (writer, model, category, title, content, postingDate) values (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getModel());
			pstmt.setString(3, board.getCategory());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			pstmt.setTimestamp(6, new Timestamp(new Date().getTime()));

			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//특정 게시글 선택
	public Board select(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from board where id = ? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeBoardFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	//수정
	public int update(Connection conn, Board board) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update board set title=?, writer=?, model=?, category=?, content=?, postingDate=?  where id=?");
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getModel());
			pstmt.setString(4, board.getCategory());
			pstmt.setString(5, board.getContent());
			pstmt.setTimestamp(6, new Timestamp(new Date().getTime()));
			pstmt.setInt(7, board.getId());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//삭제
	public int delete(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("delete from board where id = ?");
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//이하 세 메소드는 검색을 위한 것
	public BoardListView getSearchList(Connection conn, int pageNumber, String keyword)
			throws Exception {
		int currentPageNumber = pageNumber;
		try {
			int postTotalCount = selectSearchCount(conn, keyword);
						
			List<Board> postList = null;
			int firstRow = 0;
			int endRow = 0;
			if (postTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				postList = searchList(conn, firstRow,  endRow, keyword);
			} else {
				currentPageNumber = 0;
				postList = Collections.emptyList();
			}
			return new BoardListView(postTotalCount, currentPageNumber, postList, 
					MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new Exception("Errors:" + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	
		public int selectSearchCount(Connection conn, String keyword) throws SQLException {
			Statement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from board where (title like '%"+keyword+"%' or content like '%"+keyword+"%' or category like '%"+keyword+"%')");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(stmt);
			}
		}
		
		
		public List<Board> searchList(Connection conn, int firstRow, int endRow, String keyword)
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement("select * from board where (title like '%"+keyword+"%' or content like '%"+keyword+"%' or category like '%"+keyword+"%') order by id desc limit ?, ?"); // first, lboardt
				pstmt.setInt(1, firstRow - 1);
				pstmt.setInt(2, endRow - firstRow + 1);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					List<Board> boardList = new ArrayList<Board>();
					do {
						boardList.add(makeBoardFromResultSet(rs));
					} while (rs.next());
					return boardList;
				} else {
					return Collections.emptyList();
				}
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
		}

	
}
