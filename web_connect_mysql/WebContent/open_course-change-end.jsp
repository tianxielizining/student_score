<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
 <%request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.util.logging.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Date" %>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开课数据库</title>
<link rel="stylesheet" type="text/css"  href="css/style.css"  />
		   <style type="text/css">
body{
	font-weight:200;
	scroll=no;
}
table{
    margin: 170px auto;
    width:600px;
    font-family:Arial;
    font-weight:200;
    border-collapse:collapse;
    text-align:center;
}
table, tr, td{
    border: 1px solid black;
    top:100px;
    text-align:center;
    width:600px;
    font-weight:200;
}
tr, td{
    padding: 5px 10px;
    text-align:center;
    font-weight:200;
    white-space:nowrap; 
}
input{
    width: 100px;
	height: 30px;
}
a{
	font-family:Arial;
	text-align:center;
	height: auto;
	font-size:12px;
	display: inline-block;
    text-decoration: none;
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 7px;
    width:auto; 
	
}
a:link,a:visited{  /* 超链接正常状态、被访问过的样式 */
    color:white;
    padding:4px 10px 4px 10px;
    background-color:#1dabeb;
    text-decoration:none;
 
    border-top:1px solid #EEEEEE; /* 边框实现阴影效果 */
    border-left:1px solid #EEEEEE;
    border-bottom:1px solid #717171;
    border-right:1px solid #717171;
}
a:hover{       /* 鼠标指针经过时的超链接 */
    color:white;     /* 改变文字颜色 */
    padding:5px 8px 3px 12px;  /* 改变文字位置 */
    background-color:#1dabeb;  /* 改变背景色 */
    border-top:1px solid #717171; /* 边框变换，实现“按下去”的效果 */
    border-left:1px solid #717171;
    border-bottom:1px solid #EEEEEE;
    border-right:1px solid #EEEEEE;
}
</style>
</head>
<body style="background-color:#f2f9fd">
<% 
	Class.forName("com.mysql.jdbc.Driver");
	String userName="root";
	String userPasswd="031088";
	String dbName="student_score";
	String student="jdbc:mysql://localhost:3306/student_score?useUnicode=true&characterEncoding=utf-8";  
	Connection connection  = (Connection) DriverManager.getConnection(student,"root","031088");  
	connection =DriverManager.getConnection(student,userName,userPasswd);  
	
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
    String C_NUM = request.getParameter("C_NUM");
    String T_NUM = request.getParameter("T_NUM");
    String C_TERM = request.getParameter("C_TERM");
    
    Statement statement = (Statement) connection.createStatement();
    String query = "SELECT * FROM open_course where C_NUM='"+C_NUM+"';"; 
    ResultSet result = statement.executeQuery(query);
   %>
     <center><h1>数据库操作结果</h1></center>
     <p> 
   <%
	   if(result.next()){
		   String sql="update open_course set C_TERM='"+C_TERM+"'where C_NUM= '"+C_NUM+"';";
	       statement.executeUpdate(sql);
	         out.println("成功更新开课信息表:课程号为"+C_NUM+"<br>");
	     }
	 	 else {
	   	   out.println("不存在"+C_NUM+",修改失败！！！");
	 	 }

          %>
     <br>
     <br>
     <a href="open_course-select.jsp">查看数据库数据</a>
     </p>
</body>
</html>