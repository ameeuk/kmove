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
<%@taglib prefix= "tool" uri= "/WEB-INF/tld/tools.tld" %>

<%--�Խñ� ���. NoticeView.java ������ �����ϸ� �� �������� ����� �Ѹ� --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>A/S�Խ���</title>
</head>
<body>
<center>
<jsp:include page="/Header.jsp"/>
</center>

<tool:shading/>
<center><font size="5">A/S �Խ���</font></center>
<tool:shading/>

<table width="800" cellspacing="0" align="center" cellpadding="10">
<c:choose>	
	<c:when test="${boardList.messageTotalCount == 0 }">
		<center>��ϵ� ���� �����ϴ�.</center><br>
		<center><a href="/kmove/BoardView">[�������]</a>&nbsp;&nbsp;<a href="/kmove/pages/writeBoardForm.jsp">[�۾���]</a></center>
	</c:when>
	<c:otherwise>
		<tr bgcolor="FFD88E">
	    	<th width="10%" scope="col">��ȣ</th>
	    	<th width="15%" scope="col">��ǰ��</th>
	    	<th width="40%" scope="col">����</th>
	    	<th width="15%" scope="col">�۾���</th>
	    	<th width="20%" scope="col">�����</th>
	  	</tr>
		<c:forEach var="board" items="${listModel}">
		<tr bgcolor="FFFBF2">
			<td align="center">${board.id}</td>
			<td align="center">${board.category}</td>
			<td><a href="/kmove/BoardDetailView?id=${board.id}">${board.title}</a></td>
			<td align="center">${board.writer}</td>
			<td align="center">${board.postingDate}</td>
		</tr>
		</c:forEach>
		
		<table width="800" border="0" cellspacing="0" align="center">
		<tr>
    	<td width=30%>
    	
    	<c:forEach var="i" begin="1" end="${boardList.pageTotalCount-1}">
    	<a href="/kmove/BoardView?page=${i}">[${i}]</a>
    	</c:forEach>
      
	    </td>
	    <td align="center" WIDTH="30%">
	    <form action="/kmove/BoardSearch" method="post" accept-charset="euc-kr">
		<input type="text" size="20" maxlength="30" name="keyword" />
		<input type="submit" value="�˻�" />
	    </form>
	    
	    </td>

	    <td align="right" WIDTH="30%"><a href="/kmove/BoardForm">[�۾���]</a></td>

		</tr>
		</table>
	</c:otherwise>
</c:choose>
</table>

<center>
<jsp:include page="/Footer.jsp"/>
</center>
</body>
</html>
