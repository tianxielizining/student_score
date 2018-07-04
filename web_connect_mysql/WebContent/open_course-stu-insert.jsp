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
<title>学生数据库</title>
<link rel="stylesheet" type="text/css"  href="css/style.css"  />
 <style type="text/css">

body{
	font-weight:200;
	scroll=no;
}
table{
    margin: 20px auto;
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
    border-top:1px solid #717171; /* 边框变换，实现"按下去"的效果 */
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
   <form action="open_course-stu-insert-end.jsp" method="post">
     <br><br><br>
        <table border="1" cellspacing="0">
            <tr><th colspan="3">增加选课学生</th></tr>
            <tr>
                <td>学生学号</td>
                <td width="500px"><center><input type="text" name="S_NUM" placeholder="不可以为空" required/></center></td>
            </tr>
             <tr>
                <td>课程编号</td>
                <td width="500px"><center><input type="text" name="C_NUM" value="<%=paranB2%>"readonly="true"/></center></td>
            </tr>
             <tr>
                <td>教师编号</td>
                <td width="500px"><center><input type="text" name="T_NUM"value="<%=paranB3%>"readonly="true"/></center></td>
            </tr>
            <tr>
                <td>学生成绩</td>
                <td><center><input type="text" name="S_SCORE"value="<%=0%>"readonly="true"/></center></td>
                
            </tr>
            <tr>
                <td>课时学分</td>
                <td><center><input type="text" name="S_C_CREDIT"value="<%=0%>"readonly="true"/></center></td>
            </tr>
          
            <tr><td colspan="3" style="text-align:center;">            
            <input type="submit" class="submit" value="插入"/>    
            </td></tr>       
        </table>
        <br>
    </form>   
     <p> 
  
       <div style="position:relative;">
     	<p><a style="margin:5px;" href="open_course-stu-insert.jsp?paranB2=<%=C_NUM%>&&paranB3=<%=T_NUM%>&&paranB4=<%=S_SCORE%>&&paranB5=<%=S_C_CREDIT%>">继续插入新学生</a></p>
       	<p><a style="margin:0px;" href="open_course-select.jsp">查看课程信息</a></p>
    </div>
     
  
</body>
</html>
