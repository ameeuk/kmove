<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix= "tool" uri= "/WEB-INF/tld/tools.tld" %>

<%--글을 작성하는 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>A/S 등록</title>
</head>
<body>
<tool:shading/>
<center><font size="5">글쓰기</font></center>
<tool:shading/>

<form action="./writeBoard.jsp" method="post">
<table border="1" align="center">
  <tr>
    <th scope="row" width=20%>제목</th>
    <td><input type="text" name="title" size="50" required></td>
  </tr>
  <tr>
    <th scope="row">작성자</th>
    <td>세션에서 가져오기<input type="text" name="writer" size="20"></td>
  </tr>
  <tr>
    <th scope="row">모델명</th>
    <td><input type="text" name="model" size="50"></td>
  </tr>
  <tr>
    <th scope="row">제품군</th>
    <td>
        <select name="category" size="1">
        <option value="mouse">마우스</option>
        <option value="keyboard">키보드</option>
        <option value="headphone">헤드폰</option>
        <option value="chair">의자</option>
        <option value="etc">기타</option>
        </select>
    </td>
  </tr>
  <tr>
    <th scope="row">내용</th>
    <td><textarea name="content" cols="50" rows="10" required></textarea></td>
  </tr>
  <tr>
    <th colspan="2" scope="row"><input type="submit" value="확인"/>&nbsp;<input type="button" value="뒤로가기" onclick="history.back();" /></th>
    
    </tr>
  </table>
</form>

</body>
</html>