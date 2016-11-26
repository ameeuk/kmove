<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="dao.NoticeDao"%>
<%@ page import="model.Notice"%>
<%@ page import="java.util.*"%>

<%--게시글 상세 페이지. notice_view.jsp에서 title 부분을 클릭하면 상세페이지로 이동 --%>
<%--
		//id 값을 기준으로 해당 DB를 모두 불러옴. 
		String id = request.getParameter("noticeId"); //게시판에서 title 누르면 해당 게시글의 id 값 넘겨줌
		
		Connection conn = ConnectionProvider.getConnection();
		Notice notice = new Notice();
		NoticeDao noticeDao;
		try {
			noticeDao = new NoticeDao();
			notice = noticeDao.select(conn, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		request.setAttribute("notice", notice); //EL식을 사용하기 위해
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>
</head>
<body>
<table width="500" border="1" align="center">
  <tr>
    <td>${notice.title}</td>
    <td align="right">${notice.writer}</td>
  </tr>
  <tr>
    <td colspan="2" align="right">${notice.postingDate}</td>
  </tr>
  <tr>
    <td colspan="2" height="300"><center>${notice.content}</center></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
    <a href="/kmove/NoticeModify?id=${notice.id}">[수정]</a>&nbsp;&nbsp;<a href="/kmove/NoticeDelete?id=${notice.id}">[삭제]</a>
    <a href="/kmove/NoticeView">[목록으로]</a></td>
  </tr>
</table>

</body>
</html>