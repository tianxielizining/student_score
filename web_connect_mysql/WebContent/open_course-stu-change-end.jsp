<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.logging.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Date" %>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程数据库</title>
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
String test="jdbc:mysql://localhost:3306/student_score?useUnicode=true&characterEncoding=utf-8";  
Connection connection  = (Connection) DriverManager.getConnection(test,"root","031088");  
connection =DriverManager.getConnection(test,userName,userPasswd);  

		String paranB2 = request.getParameter("paranB2"); 
		String paranB3 = request.getParameter("paranB3"); 
		String paranB4 = request.getParameter("paranB4");   
		String paranB5 = request.getParameter("paranB5");   
  		String S_NUM = request.getParameter("S_NUM");
	    String C_NUM = request.getParameter("paranB2");
	    String T_NUM  = request.getParameter("paranB3");
	    String S_SCORE = request.getParameter("paranB4");
	    String S_C_CREDIT = request.getParameter("paranB5");  	 
		Statement statement = (Statement) connection.createStatement();   
  	 String query = "SELECT * FROM score where C_NUM=\""+ paranB2+"\";"; 
 	 ResultSet result = statement.executeQuery(query); 
  
  %>
      <h1>学生信息</h1>
    <table>
        <tr>
            <th>学生学号</th>
            <th>课程编号</th>
            <th>教师编号</th>
            <th>学生成绩</th>
            <th>所得学分</th>                 
            <th>删除</th>            
        </tr>  
   <%   
    String sql1 = "select * from score where C_NUM =\""+ paranB2+"\" and  T_NUM = \""+paranB3+"\"; "; 
    ResultSet rs1=statement.executeQuery(sql1);
    while(rs1.next()) {
         	S_NUM = rs1.getString("S_NUM");
        	C_NUM = rs1.getString("C_NUM");
        	S_SCORE = "0";
        	S_C_CREDIT = "0";
   %>
    <tr>
         	<td><%=S_NUM %></td>
            <td><%= C_NUM%></td>
            <td><%= T_NUM %> </td>
             <td><%= S_SCORE%> </td>
             <td><%= S_C_CREDIT %> </td>                        
             <td><a style=" background-color:#d01b24;" href="open_course-stu-delete.jsp?paranB2=<%=C_NUM%>&&paranB3=<%=T_NUM%>&&paranB4=<%=S_NUM%>" onclick="return confirm('确定将此记录删除?')">删除</a>  
			</td>              
        </tr>
        <%
        }
        rs1.close();
        %>       
    </table>
         <p><a href="open_course-stu-insert.jsp?paranB2=<%=C_NUM%>&&paranB3=<%=T_NUM%>&&paranB4=<%=S_SCORE%>&&paranB5=<%=S_C_CREDIT%>">增加学生</a></p>
         <p><a href="open_course-select.jsp">返回开课信息表</a></p>
</body>
</html>