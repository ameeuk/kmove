<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="dao.BoardDao"%>
<%@ page import="model.Board"%>
<%@ page import="java.util.*"%>
<%@taglib prefix= "tool" uri= "/WEB-INF/tld/tools.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--게시글 상세 페이지. board_view.jsp에서 title 부분을 클릭하면 상세페이지로 이동 --%>
<%--
		//id 값을 기준으로 해당 DB를 모두 불러옴. 
		String id = request.getParameter("boardId"); //게시판에서 title 누르면 해당 게시글의 id 값 넘겨줌
		
		Connection conn = ConnectionProvider.getConnection();
		Board board = new Board();
		BoardDao boardDao;
		try {
			boardDao = new BoardDao();
			board = boardDao.select(conn, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		request.setAttribute("board", board); //EL식을 사용하기 위해
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>A/S게시판</title>
</head>
<tool:shading/>
<center><font size="5">A/S 게시판</font></center>
<tool:shading/>

<body>
<table width="500" border="1" align="center">
  <tr>
    <td width="70%">${board.title}</td>
    <td align="right">글쓴이:${board.writer}</td>
  </tr>
  <tr>
    <td align="left">제품군:[${board.category}]<br>모델명:${board.model}</td>
    <td align="right">${board.postingDate}</td>
  </tr>
  <tr>
    <td colspan="2" height="300"><center>${board.content}</center></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
     <c:set value="ameeuk" var="ID"/>
   	<c:if test="${board.id==board.id}">
   	글쓴이 아이디와 로그인한 사람의 아이디가 같아야 [수정],[삭제] 버튼이 나타남
   	<a href="/kmove/BoardModify?id=${board.id}">[수정]</a>&nbsp;&nbsp;<a href="/kmove/BoardDelete?id=${board.id}">[삭제]</a>
   	</c:if>
    
    <a href="/kmove/BoardView">[목록으로]</a></td>
  </tr>
</table>

</body>
</html>