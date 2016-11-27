<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="model.Board"%>
<%@ page import="dao.BoardDao"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>

<%-- 작성한 값을 넘겨받아 BoardDao의 insert를 실행하여 DB에 데이터 삽입 --%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="board" class="model.Board"/>
<jsp:setProperty property="*" name="board"/>
<% 
		 try{
		     Connection conn = ConnectionProvider.getConnection();
		 	try {
		 		BoardDao boarddao = new BoardDao();
		 		boarddao.insert(conn, board);
		 	} catch (SQLException e) {
		 		e.printStackTrace();
		 	} finally {
		 		JdbcUtil.close(conn);
		 	}
		 	
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
self.window.alert("글이 작성되었습니다.");
location.href = "/kmove/BoardView";
</script>

</body>
</html>