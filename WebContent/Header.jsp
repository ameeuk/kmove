<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>header</title>
<style type="text/css">
body {
    margin:0;
    padding:0;
    line-height: 1.2em;
    font-size: 0.75em;
    line-height: 1.2em;
}

.left {
    float: left;
}

.right {
    float: right;
}

#logo {
    float: left;
    vertical-align: middle;
    margin:30px 0 0 20px;
}
hr {
    clear: both;
}

nav {
    margin:0 0 20px 0;
    float:left;
    width : 900px;
}
    
nav ul li {
    float:left;    
    margin:0 5px;
    list-style:none;
}

nav a {
    display:block;
    padding:5px;
    height : 20px;
}

#login {
    margin: 30px;
}

#login fieldset span {
    display: inline-block;
}

#signup {
    margin: 30px;
}

#signup fieldset span {
    display: inline-block;
    vertical-align: middle;
}

#signup fieldset input {
    vertical-align: middle;
}

</style>

</head>
<body>

<div style="height: auto; width: 800px;">
	<a href="index.jsp"><img src="image/k-move.jpg" width="100px" height="70px" align="left"/></a>
	<span class="right" >
	<u:isLogin>
	${authUser.name}��, �ȳ��ϼ���. 
	<a href="logout.do">[�α׾ƿ��ϱ�]</a>
	</u:isLogin>
	<u:notLogin>
	<a href="join.do">[ȸ�������ϱ�]</a>
	<a href="login.do">[�α����ϱ�]</a>
	</u:notLogin>
	</span>  

<nav>
	<ul> 
		<li><a href="Information.jsp"> <font color=tomato size=4>ȸ��Ұ� </font></a></li>  
  		<li><a href="Product.jsp"><font color=tomato size=4>��ǰ�Ұ� </font></a></li>
  		<li><a href="/kmove/NoticeView"><font color=tomato size=4>�������� </font></a></li>
  		<li><a href="/kmove/BoardView"><font color=tomato size=4>A/S���� </font></a></li>
	</ul>
	
</nav>
<hr style="border: solid 1px;">
</div>


</body>
</html>