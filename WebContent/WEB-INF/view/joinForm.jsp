<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원가입</title>
</head>
<body>
<table align="center">
  <tr>
    <td>
    <form action="join.do" method="post">
<p>
	아이디:<br/><input type="text" name="id" value="${param.id}">
	<c:if test="${errors.id}">ID를 입력하세요.</c:if>
	<c:if test="${errors.duplicateId}">이미 사용중인 아이디입니다.</c:if>
</p>
<p>
	이름:<br/><input type="text" name="name" value="${param.name}">
	<c:if test="${errors.name}">이름을 입력하세요.</c:if>
</p>
<p>
	암호:<br/><input type="password" name="password">
	<c:if test="${errors.password}">암호를 입력하세요.</c:if>
<p>
	확인:<br/><input type="password" name="confirmPassword">
	<c:if test="${errors.confirmPassword}">비밀번호 확인.</c:if>
	<c:if test="${errors.notMatch}">암호가 일치하지 않습니다.</c:if>
</p>
<input type="submit" value="회원가입">&nbsp;<input type="button" value="뒤로가기" onclick="history.back();" />
</form>
    </td>
  </tr>
</table>

</body>
</html>