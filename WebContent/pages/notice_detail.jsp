<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="dao.NoticeDao"%>
<%@ page import="model.Notice"%>
<%@ page import="java.util.*"%>
<%@taglib prefix= "tool" uri= "/WEB-INF/tld/tools.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--�Խñ� �� ������. notice_view.jsp���� title �κ��� Ŭ���ϸ� ���������� �̵� --%>
<%--
		//id ���� �������� �ش� DB�� ��� �ҷ���. 
		String id = request.getParameter("noticeId"); //�Խ��ǿ��� title ������ �ش� �Խñ��� id �� �Ѱ���
		
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
		
		request.setAttribute("notice", notice); //EL���� ����ϱ� ����
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
</head>
<body>
<center>
<jsp:include page="/Header.jsp"/>
</center>

<tool:shading/>
<center><font size="5">��������</font></center>
<tool:shading/>

<table width="500" border="0" align="center" cellpadding="10">
  <tr bgcolor="FFD88E">
    <td >${notice.title}</td>
    <td align="right">${notice.writer}</td>
  </tr>
  <tr>
    <td colspan="2" align="right" bgcolor="FFFBF2">${notice.postingDate}</td>
  </tr>
  <tr>
    <td colspan="2" height="300" bgcolor="FFFBF2"><center>${notice.content}</center></td>
  </tr>
  <tr bgcolor="FFD88E">
    <td colspan="2" align="center">
    <!--�۾��� ���̵�� �α����� ����� ���̵� ���ƾ� [����],[����] ��ư�� ��Ÿ�� -->
    <c:if test="${notice.writer==authUser.id }">
    <a href="/kmove/NoticeModify?id=${notice.id}">[����]</a>&nbsp;&nbsp;<a href="/kmove/NoticeDelete?id=${notice.id}">[����]</a>
    </c:if>
    <a href="/kmove/NoticeView">[�������]</a></td>
  </tr>
</table>

<center>
<jsp:include page="/Footer.jsp"/>
</center>
</body>
</html>