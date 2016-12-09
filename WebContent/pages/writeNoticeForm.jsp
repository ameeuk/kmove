<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix= "tool" uri= "/WEB-INF/tld/tools.tld" %>

<%--글을 작성하는 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항 등록</title>
</head>
<body>
<center>
<jsp:include page="/Header.jsp"/>
</center>

<tool:shading/>
<center><font size="5">글쓰기</font></center>
<tool:shading/>

<form action="/kmove/pages/writeNotice.jsp" method="post">
<table border="0" align="center" cellpadding="10">
  <tr>
    <th scope="row" bgcolor="FFD88E">제목</th>
    <td bgcolor="FFFBF2"><input type="text" name="title" size="50" required></td>
  </tr>
  <tr>
    <th scope="row" bgcolor="FFD88E">작성자</th>
    <td bgcolor="FFFBF2">${authUser.id}<input type="hidden" name="writer" size="20" value="${authUser.id}"></td>
  </tr>
  <tr>
    <th scope="row" bgcolor="FFD88E">내용</th>
    <td bgcolor="FFFBF2"><textarea name="content" cols="50" rows="10" required></textarea></td>
  </tr>
  <tr>
    <th colspan="2" scope="row" bgcolor="FFFBF2"><input type="submit" value="확인"/>&nbsp;<input type="button" value="뒤로가기" onclick="history.back();" /></th>
  </tr>
  </table>
</form>

<center>
<jsp:include page="/Footer.jsp"/>
</center>
</body>
</html>