<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--���� �ۼ��ϴ� ������ --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>A/S ���</title>
</head>
<body>
<form action="./writeBoard.jsp" method="post">
<table border="1" align="center">
  <tr>
    <th scope="row" width=20%>����</th>
    <td><input type="text" name="title" size="50" required></td>
  </tr>
  <tr>
    <th scope="row">�ۼ���</th>
    <td>���ǿ��� ��������<input type="text" name="writer" size="20"></td>
  </tr>
  <tr>
    <th scope="row">�𵨸�</th>
    <td><input type="text" name="model" size="50"></td>
  </tr>
  <tr>
    <th scope="row">��ǰ��</th>
    <td>
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
    <th scope="row">����</th>
    <td><textarea name="content" cols="50" rows="10" required></textarea></td>
  </tr>
  <tr>
    <th colspan="2" scope="row"><input type="submit" value="Ȯ��"/>&nbsp;<input type="button" value="�ڷΰ���" onclick="history.back();" /></th>
    
    </tr>
  </table>
</form>

</body>
</html>