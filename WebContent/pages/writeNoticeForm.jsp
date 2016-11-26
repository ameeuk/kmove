<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--글을 작성하는 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항 등록</title>
</head>
<body>
<form action="./writeNotice.jsp" method="post">
<table width="200" border="1">
  <tr>
    <th scope="row">제목</th>
    <td><input type="text" name="title" size="20" required></td>
  </tr>
  <tr>
    <th scope="row">작성자</th>
    <td>세션에서 가져오기<input type="text" name="writer" size="20"></td>
  </tr>
  <tr>
    <th scope="row">내용</th>
    <td><textarea name="content" cols="40" rows="5" required></textarea></td>
  </tr>
  <tr>
    <th colspan="2" scope="row"><input type="submit" value="확인"/>&nbsp;<input type="button" value="뒤로가기" onclick="history.back();" /></th>
    
    </tr>
  </table>
</form>

</body>
</html>