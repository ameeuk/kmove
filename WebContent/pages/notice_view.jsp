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

<%--�Խñ� ���. NoticeView.java ������ �����ϸ� �� �������� ����� �Ѹ� --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
</head>
<body>
<table width="980" border="1"  cellspacing="0" align="center">
<c:choose>	
	<c:when test="${noticeList.messageTotalCount == 0 }">
		<center>��ϵ� ���� �����ϴ�.</center><br>
		<center><a href="/kmove/NoticeView">[�������]</a>&nbsp;&nbsp;<a href="/kmove/pages/writeNoticeForm.jsp">[�۾���]</a></center>
	</c:when>
	<c:otherwise>
		<tr>
	    	<th width="10%" scope="col">��ȣ</th>
	    	<th width="15%" scope="col">�۾���</th>
	    	<th width="15%" scope="col">����</th>
	    	<th width="20%" scope="col">�����</th>
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
		<input type="submit" value="�˻�" />
	    </form>
	    </td>
	    <td align="right" WIDTH="30%"><a href="/kmove/pages/writeNoticeForm.jsp">[�۾���]</a></td>
		</tr>
		</table>
	</c:otherwise>
</c:choose>
</table>

</body>
</html>
