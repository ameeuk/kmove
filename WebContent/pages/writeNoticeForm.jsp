<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--���� �ۼ��ϴ� ������ --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� ���</title>
</head>
<body>
<form action="./writeNotice.jsp" method="post">
<table width="200" border="1">
  <tr>
    <th scope="row">����</th>
    <td><input type="text" name="title" size="20" required></td>
  </tr>
  <tr>
    <th scope="row">�ۼ���</th>
    <td>���ǿ��� ��������<input type="text" name="writer" size="20"></td>
  </tr>
  <tr>
    <th scope="row">����</th>
    <td><textarea name="content" cols="40" rows="5" required></textarea></td>
  </tr>
  <tr>
    <th colspan="2" scope="row"><input type="submit" value="Ȯ��"/>&nbsp;<input type="button" value="�ڷΰ���" onclick="history.back();" /></th>
    
    </tr>
  </table>
</form>

</body>
</html>