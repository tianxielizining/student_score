<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.logging.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Date" %>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<%@page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程数据库</title>
 <link rel="stylesheet"   />
 <style type="text/css">

body{
	font-weight:200;
	scroll=no;
}
table{
    margin: 70px auto;
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
 	 Class.forName("com.mysql.jdbc.Driver");                   //加载jdbc驱动  
 	 String student = "jdbc:mysql://localhost:3306/student_score?useUnicode"  //地址
 	                 + "=true&characterEncoding=utf-8&useSSL=false";  
 	 Connection connection  = (Connection) DriverManager.getConnection(student,"root","031088");  
 	 String C_NUM = request.getParameter("C_NUM");
 	 Statement statement = (Statement) connection.createStatement();  //连接实例
 	 String query = "SELECT * FROM course where C_NUM='"+C_NUM+"'"; 
 	 ResultSet result = statement.executeQuery(query); 
   %>

    
    <table>
        <tr>
            <td>课程编号</td>
            <td>课程名称</td>
            <td>课程类别</td>
            <td>课时</td>   
            <td>学分</td>
            <td>授课学位</td>  
            <td>修改</td>
            <td>删除</td>
        
        </tr>
        <% 
        String sql1 = "SELECT * FROM course";
        ResultSet rs1 = statement.executeQuery(sql1);
        while(rs1.next()) {
            C_NUM = rs1.getString("C_NUM");
            String C_NAME = rs1.getString("C_NAME");
            String C_ILLU = rs1.getString("C_ILLU");
            String C_TIME = rs1.getString("C_TIME");
            String C_CREDIT = rs1.getString("C_CREDIT");
            String C_DEGREE = rs1.getString("C_DEGREE");    
        %>
        <tr>
         	<td><%= C_NUM %> </td>
            <td><%= C_NAME %> </td>
            <td><%= C_ILLU %> </td>
            <td><%= C_TIME %> </td>   
            <td><%= C_CREDIT %> </td>
            <td><%= C_DEGREE %> </td>   
            <td><a href="course-change.jsp?C_NUM=<%=C_NUM%>" class="bt">修改</a> </td>       
         <!--    <td><a style=" background-color:#d01b24;"href="course-delete.jsp?paramA=<%=C_NUM%>">删除</a> </td>   -->
          <td><a style=" background-color:#d01b24;" href="course-delete.jsp?paramA=<%=C_NUM%>" onclick="return confirm('确定将此记录删除?')">删除</a>  
			</td>
        </tr>
        <%
        }
        rs1.close();
        %>
    </table >
     <div style="position:relative;">
     <p ><a style=" margin-left:470px;margin-top:0px;" href="course-insert.jsp">增加开课信息</a></p>
     
     
    </div>
   
   
</body>
</html>