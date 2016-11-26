<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--게시글 수정 페이지. notice_detail.jsp의 수정 버튼을 누르면 NoticeModify.java를 거쳐 기존의 값을 가져옴 --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항 수정</title>
</head>
<body>

<form action="/kmove/pages/modifyNotice.jsp" method="post">
<input type="hidden" name="id" value="${notice.id}">
<table width="200" border="1">
  <tr>
    <th scope="row">제목</th>
    <td><input type="text" name="title" size="20" value="${notice.title}" required></td>
  </tr>
  <tr>
    <th scope="row">작성자</th>
    <td><input type="hidden" name="writer" value="${notice.writer}">${notice.writer}</td>
  </tr>
  <tr>
    <th scope="row">내용</th>
    <td><textarea name="content" cols="40" rows="5" required>${notice.content}</textarea></td>
  </tr>
  <tr>
    <th colspan="2" scope="row"><input type="submit" value="확인"/>&nbsp;<input type="button" value="뒤로가기" onclick="history.back();" /></th> 
    </tr>
  </table>
</form>

</body>
</html>