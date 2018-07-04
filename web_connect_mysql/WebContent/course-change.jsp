<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
 <%request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.util.logging.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
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


	Statement statement = (Statement) connection.createStatement();
		String query = "SELECT C_NAME,C_ILLU,C_TIME,C_CREDIT,C_DEGREE FROM  course where C_NUM='"+C_NUM+"';";
		ResultSet rs = statement.executeQuery(query);    
		rs.next();
		String C_NAME=rs.getString(1);
		String C_ILLU=rs.getString(2);
		String C_TIME=rs.getString(3);
		String C_CREDIT=rs.getString(4);
		String C_DEGREE=rs.getString(5);
		
%>
<form action="course-change-end.jsp" method="post">
     <br>
        <table border="1" cellspacing="0">
            <tr><th colspan="3">更改课程信息</th></tr>
            <tr>
                <td>课程编号</td>
                <td width="500px"><center><input type="text" name="C_NUM" value="<%=C_NUM%>"readonly="true"/></center></td>
            </tr>
             <tr>
                <td>课程名称</td>
                <td width="500px"><center><input type="text" name="C_NAME"value="<%=C_NAME%>"/></center></td>
            </tr>
             <tr>
                <td>课程类别</td>
                <td width="500px"><center><input type="text" name="C_ILLU"value="<%=C_ILLU%>"/></center></td>
            </tr>
            <tr>
                <td>课时</td>
                <td><center><input type="text" name="C_TIME"value="<%=C_TIME%>"/></center></td>
                
            </tr>
            <tr>
                <td>学分</td>
                <td><center><input type="text" name="C_CREDIT" value="<%=C_CREDIT%>"/></center></td>
            </tr>
            <tr>
                
             <td>授课学位</td>  
                <td><center>
                <select name="C_DEGREE" size="1">
                <option value=<%=C_DEGREE%>><%=C_DEGREE%></option>
                		<option value="本科">本科</option>
                		<option value="硕士">硕士</option>
                		<option value="博士">博士</option>
                	</select>
                </center></td>
            </tr>
            <tr><td colspan="3" style="text-align:center;">            
            <input type="submit" class="submit" value="更新"/>    
            </td></tr>       
        </table>
        <br>
    </form>

     <a href="course-select.jsp">查看数据库数据</a>

</body>

      	
     