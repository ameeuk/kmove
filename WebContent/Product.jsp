<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>제품소개</title>
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
	.right
	{
		float: right;
	}
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="Header.jsp"/>
	</div>
	<br><br><br><br><br>
	<b>마우스</b>
	<br><br><hr color="red"><br><br>
	<a href="Mouse1_detail.jsp"> <img src="image/mouse1.png" width="100" > </a>	
	<img src="image/mouse2.png" width="100" >
	<img src="image/mouse3.png" width="100" >
<br>
<br><br><hr color="red"><br><br><br>
	<b>키보드</b>
	<br><br><hr color="red"><br><br>
	<img src="image/keyboard1.PNG" width="100" >
	<img src="image/keyboard2.png" width="100" >
	<img src="image/keyboard3.png" width="100" >
<br><br><hr color="red"><br><br>
	<div id="footer">
			<jsp:include page="Footer.jsp"/>
	</div>
</div>
</body>
</html>