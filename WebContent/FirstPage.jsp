<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style>
	p{
		text-align:center;
	}
</style>
</head>
<body>
	<p>
	<img src="/image/main.PNG" alt="leaf" style="max-width: 90%; height: auto;">
	</p>
	
	
	<table border="1" width="678"> <!--valign="top"-->
              <tr> <td width="252" height="23">
                          <p align="center"> <font color="blue" face="굴림" size="2">subject</font></p> </td>                               
                   <td width="82" height="23">                                                                    
                          <p align="center"><a href="#" target="_self"><span style="font-size:8pt;">more</span></a></p> </td>  </tr>  </table>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
   		String url = "jdbc:mysql://localhost:3306/test";
   		String id = "sean";
   		String pw = "0000";
    	
   		Class.forName("com.mysql.jdbc.Driver");
   		
   		conn=DriverManager.getConnection(url, id, pw);

		String sql="select name, address from address order by name desc limit 0,5";
   		pstmt = conn.prepareStatement(sql);
   		ResultSet rs = pstmt.executeQuery();		
%>   
    <table border="1" width="678">
    	<tr>
    		<td width="668">
    			<p><a href = "#"></a></p>
    		</td>
    	</tr> 
    </table>
<%     
	}catch(Exception e){
		out.println(e);
		}
%> 
</body>
</html>