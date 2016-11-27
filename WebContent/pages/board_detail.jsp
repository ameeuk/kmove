<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="dao.BoardDao"%>
<%@ page import="model.Board"%>
<%@ page import="java.util.*"%>

<%--�Խñ� �� ������. board_view.jsp���� title �κ��� Ŭ���ϸ� ���������� �̵� --%>
<%--
		//id ���� �������� �ش� DB�� ��� �ҷ���. 
		String id = request.getParameter("boardId"); //�Խ��ǿ��� title ������ �ش� �Խñ��� id �� �Ѱ���
		
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
		
		request.setAttribute("board", board); //EL���� ����ϱ� ����
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>A/S�Խ���</title>
</head>
<body>
<table width="500" border="1" align="center">
  <tr>
    <td width="70%">${board.title}</td>
    <td align="right">�۾���:${board.writer}</td>
  </tr>
  <tr>
    <td align="left">��ǰ��:[${board.category}]<br>�𵨸�:${board.model}</td>
    <td align="right">${board.postingDate}</td>
  </tr>
  <tr>
    <td colspan="2" height="300"><center>${board.content}</center></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
    <a href="/kmove/BoardModify?id=${board.id}">[����]</a>&nbsp;&nbsp;<a href="/kmove/BoardDelete?id=${board.id}">[����]</a>
    <a href="/kmove/BoardView">[�������]</a></td>
  </tr>
</table>

</body>
</html>