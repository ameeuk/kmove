<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회사소개</title>
<style>
	#wrap{
		width:800px;
		margin: 0 auto 0 auto;
	}
	#header {
		text-align: center;
	}
	#main {
		float: left;
	}
	#footer {
		clear: none;
	}
	p{
		text-align:center;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="Header.jsp"/>
		</div>
		<p>
		<img src="image/main_image.png">
		<p>
		<div id="footer">
			<jsp:include page="Footer.jsp"/>
		</div>
	</div>
</body>
</html>