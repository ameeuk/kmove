<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix= "tool" uri= "/WEB-INF/tld/tools.tld" %>

<%--�Խñ� ���� ������. board_detail.jsp�� ���� ��ư�� ������ BoardModify.java�� ���� ������ ���� ������ --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>A/S ����</title>
</head>
<body>
<center>
<jsp:include page="/Header.jsp"/>
</center>

<tool:shading/>
<center><font size="5">A/S ����</font></center>
<tool:shading/>

<form action="/kmove/pages/modifyBoard.jsp" method="post">
<input type="hidden" name="id" value="${board.id}">
<table border="0" align="center" cellpadding="10">
  <tr>
    <th scope="row" width=20% bgcolor="FFD88E">����</th>
    <td bgcolor="FFFBF2"><input type="text" name="title" size="50" value="${board.title}" required></td>
  </tr>
  <tr>
    <th scope="row" bgcolor="FFD88E">�ۼ���</th>
    <td bgcolor="FFFBF2"><input type="hidden" name="writer" size="20" value="${board.writer}">${board.writer}</td>
  </tr>
  <tr>
    <th scope="row" bgcolor="FFD88E">�𵨸�</th>
    <td bgcolor="FFFBF2"><input type="text" name="model" size="50" value="${board.model}"></td>
  </tr>
  <tr>
    <th scope="row" bgcolor="FFD88E">��ǰ��</th>
    <td bgcolor="FFFBF2">
        <select name="category" size="1">
        <option value="mouse">���콺</option>
        <option value="keyboard">Ű����</option>
        <option value="headphone">�����</option>
        <option value="chair">����</option>
        <option value="etc">��Ÿ</option>
        </select>
    </td>
  </tr>
  <tr>
    <th scope="row" bgcolor="FFD88E">����</th>
    <td bgcolor="FFFBF2"><textarea name="content" cols="50" rows="10" required>${board.content}</textarea></td>
  </tr>
  <tr bgcolor="FFFBF2">
    <th colspan="2" scope="row"><input type="submit" value="Ȯ��"/>&nbsp;<input type="button" value="�ڷΰ���" onclick="history.back();" /></th>
    </tr>
  </table>
</form>

<center>
<jsp:include page="/Footer.jsp"/>
</center>
</body>
</html>