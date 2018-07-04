<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

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

<title>学生数据库</title>
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
    top:20px;
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
String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
Connection conn=DriverManager.getConnection(Url);
Statement stmt = conn.createStatement();
	/*String userName="root";
	String userPasswd="031088";
	String dbName="student_score";
	String test="jdbc:mysql://localhost:3306/student_score?useUnicode=true&characterEncoding=utf-8";  
	Connection connection  = (Connection) DriverManager.getConnection(test,"root","031088");  
	connection =DriverManager.getConnection(test,userName,userPasswd);  */
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");

	
	
		 String C_NUM = request.getParameter("C_NUM");
	   	String C_NAME = request.getParameter("C_NAME");
	    String C_ILLU = request.getParameter("C_ILLU");
	    String C_TIME= request.getParameter("C_TIME");
	    String C_CREDIT = request.getParameter("C_CREDIT");
	    String C_DEGREE = request.getParameter("C_DEGREE");
	    //Statement statement = (Statement) connection.createStatement();
	    
	  	Statement statement = (Statement) conn.createStatement();
	   
   %>
   <form action="course-insert-end.jsp"  method="post">
     <br><br><br>
        <table border="1" cellspacing="0">
            <tr><th colspan="3">课程表插入信息</th></tr>
            <tr>
                <td>课程编号</td>
                <td width="500px"><center><input type="text" name="C_NUM" placeholder="不可以为空"/></center></td>
            </tr>
             <tr>
                <td>课程名称</td>
                <td width="500px"><center><input type="text" name="C_NAME"placeholder="不可以为空"/></center></td>
            </tr>
             <tr>
                <td>课程类别</td>
                <!--  <td width="500px"><center><input type="text" name="C_ILLU"placeholder="不可以为空"/></center></td>-->
            	<td><center>
                <select   name="C_ILLU" >
                		<option value="学类核心/必修课 ">学类核心/必修课 </option>
                		<option value="学门核心/必修课">学门核心/必修课</option>
                		<option value="专业任选/任选课">专业任选/任选课</option>
                		<option value="通识课/任选课">通识课/任选课</option>
                		<option value="其他">其他</option>
                	</select>
                </center></td>
            
            </tr>
            <tr>
                <td>课时</td>
                <td><center><input  type="number" name="C_TIME"placeholder="不可以为空"/></center></td>
                
            </tr>
            <tr>
                <td>学分</td>
                <td><center><input type="text" name="C_CREDIT"placeholder="不可以为空"/></center></td>
            </tr>
            <tr>
                <td >授课学位</td>  
                <td><center>
                <select   name="C_DEGREE" >
                		<option value="本科">本科</option>
                		<option value="硕士">硕士</option>
                		<option value="博士">博士</option>
                	</select>
                </center></td>
            </tr>
            <tr><td colspan="3" style="text-align:center;">            
            <input type="submit" class="submit" value="插入"/>    
            </td></tr>       
        </table>
        <br>
    </form>   
     <p> 
  
       <div style="position:relative;top:-150px;">
     	<p><a href="course-insert.jsp">继续插入新课程</a></p>
       	<p><a href="course-select.jsp">查看课程信息</a></p>
    </div>
     
  
</body>
</html>
