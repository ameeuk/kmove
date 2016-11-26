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
import model.Notice;
import model.NoticeListView;

public class NoticeDao {

	//전체 게시글 수 구함
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from notice");
			rs.next();
			return rs.getInt(1);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
		}
	}
	
	
	
	public List<Notice> selectList(Connection conn, int firstRow, int endRow) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement("select id, writer, title, content, postingDate from notice order by id desc limit ?,?");
			pstmt.setInt(1, firstRow-1);
			pstmt.setInt(2, endRow-firstRow+1);
			rs = pstmt.executeQuery();
			if(!rs.next()){
				return Collections.emptyList();
			}
			List<Notice> noticeList = new ArrayList<Notice>();
			do{
				Notice notice = makeNoticeFromResultSet(rs);
				noticeList.add(notice);
			}while(rs.next());
			return noticeList;
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		}
		
	}
	
	protected Notice makeNoticeFromResultSet(ResultSet rs)
			throws SQLException {
		Notice notice = new Notice();
		notice.setId(rs.getInt("id"));
		notice.setWriter(rs.getString("writer"));
		notice.setTitle(rs.getString("title"));
		notice.setContent(rs.getString("content"));
		notice.setPostingDate(rs.getTimestamp("postingDate"));
		return notice;
	}
	
	
	//전체 게시글을 해당 숫자 단위로 끊어서 각각 리스트로 저장
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	public NoticeListView getNoticeList(Connection conn, int pageNumber) throws Exception {
		int currentPageNumber = pageNumber;
		try {
			int noticeTotalCount = selectCount(conn);

			List<Notice> noticeList = null;
			int firstRow = 0;
			int endRow = 0;
			if (noticeTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				noticeList = selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				noticeList = Collections.emptyList();
			}
			return new NoticeListView(noticeTotalCount, currentPageNumber, noticeList, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new Exception("Errors:" + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	
	//삽입
	public int insert(Connection conn, Notice notice) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into notice (writer, title, content, postingDate) values (?, ?, ?, ?)");
			pstmt.setString(1, notice.getWriter());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
			pstmt.setTimestamp(4, new Timestamp(new Date().getTime()));

			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//특정 게시글 선택
	public Notice select(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from notice where id = ? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeNoticeFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	//수정
	public int update(Connection conn, Notice notice) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update notice set title=?, writer=?, content=?, postingDate=?  where id=?");
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getWriter());
			pstmt.setString(3, notice.getContent());
			pstmt.setTimestamp(4, new Timestamp(new Date().getTime()));
			pstmt.setInt(5, notice.getId());
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
			pstmt = conn.prepareStatement("delete from notice where id = ?");
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	//이하 세 메소드는 검색을 위한 것
	public NoticeListView getSearchList(Connection conn, int pageNumber, String keyword)
			throws Exception {
		int currentPageNumber = pageNumber;
		try {
			int postTotalCount = selectSearchCount(conn, keyword);
						
			List<Notice> postList = null;
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
			return new NoticeListView(postTotalCount, currentPageNumber, postList, 
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
				rs = stmt.executeQuery("select count(*) from notice where (title like '%"+keyword+"%' or content like '%"+keyword+"%')");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(stmt);
			}
		}
		
		
		public List<Notice> searchList(Connection conn, int firstRow, int endRow, String keyword)
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement("select * from notice where (title like '%"+keyword+"%' or content like '%"+keyword+"%') order by id desc limit ?, ?"); // first, last
				pstmt.setInt(1, firstRow - 1);
				pstmt.setInt(2, endRow - firstRow + 1);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					List<Notice> noticeList = new ArrayList<Notice>();
					do {
						noticeList.add(makeNoticeFromResultSet(rs));
					} while (rs.next());
					return noticeList;
				} else {
					return Collections.emptyList();
				}
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
		}

	
}
