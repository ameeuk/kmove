<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="dao.NoticeDao"%>
<%@ page import="model.Notice"%>
<%@ page import="model.NoticeListView"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.net.URLEncoder" %>

<%--게시글 목록. NoticeView.java 서블릿을 실행하면 이 페이지로 목록을 뿌림 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>
</head>
<body>
<table width="980" border="1"  cellspacing="0" align="center">
<c:choose>	
	<c:when test="${noticeList.messageTotalCount == 0 }">
		<center>등록된 글이 없습니다.</center><br>
		<center><a href="/kmove/NoticeView">[목록으로]</a>&nbsp;&nbsp;<a href="/kmove/pages/writeNoticeForm.jsp">[글쓰기]</a></center>
	</c:when>
	<c:otherwise>
		<tr>
	    	<th width="10%" scope="col">번호</th>
	    	<th width="15%" scope="col">글쓴이</th>
	    	<th width="15%" scope="col">제목</th>
	    	<th width="20%" scope="col">등록일</th>
	  	</tr>
		<c:forEach var="notice" items="${listModel}">
		<tr>
			<td align="center">${notice.id}</td>
			<td align="center">${notice.writer}</td>
			<td><a href="/kmove/NoticeDetailView?id=${notice.id}">${notice.title}</a></td>
			<td align="center">${notice.postingDate}</td>
		</tr>
		</c:forEach>
		
		<table width="980" border="0" cellspacing="0" align="center">
		<tr>
    	<td width=30%>
    	
    	<c:forEach var="i" begin="1" end="${noticeList.pageTotalCount-1}">
    	<a href="/kmove/NoticeView?page=${i}">[${i}]</a>
    	</c:forEach>
      
	    </td>
	    <td align="center" WIDTH="30%">
	    <form action="/kmove/NoticeSearch" method="post" accept-charset="euc-kr">
		<input type="text" size="20" maxlength="30" name="keyword" />
		<input type="submit" value="검색" />
	    </form>
	    </td>
	    <td align="right" WIDTH="30%"><a href="/kmove/pages/writeNoticeForm.jsp">[글쓰기]</a></td>
		</tr>
		</table>
	</c:otherwise>
</c:choose>
</table>

</body>
</html>
