<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="model.Notice"%>
<%@ page import="dao.NoticeDao"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>

<%-- notice_modify.jsp로 부터 입력받은 값으로 수정 NoticeDao.java의 update 실행--%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="notice" class="model.Notice"/>
<jsp:setProperty property="*" name="notice"/>
<% 
		 try{
		     Connection conn = ConnectionProvider.getConnection();
		 	try {
		 		NoticeDao noticedao = new NoticeDao();
		 		noticedao.update(conn, notice);
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
${notice.id }
<script>
self.window.alert("글이 수정되었습니다.");
location.href = "/kmove/NoticeDetailView?id=${notice.id}";
</script>

</body>
</html>