<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%> 
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
 Class.forName("com.mysql.jdbc.Driver");                   //加载jdbc驱动  
 String student = "jdbc:mysql://localhost:3306/student_score?useUnicode"  //地址
                 + "=true&characterEncoding=utf-8&useSSL=false";  
 Connection connection  = (Connection) DriverManager.getConnection(student,"root","031088");  
%>
     <h1>学生操作结果</h1>
     <p> 

        <%
        String paranB2 = request.getParameter("paranB2"); 
    	String C_NUM = request.getParameter("paranB2");
    	String paranB3 = request.getParameter("paranB3"); 
      	String T_NUM = request.getParameter("paranB3");
      	
    	String paranB4 = request.getParameter("paranB4"); 
      	String S_NUM = request.getParameter("paranB4");
    	
 		Statement statement = (Statement) connection.createStatement();  //连接实例
 		String query = "SELECT * FROM  score where S_NUM='"+paranB4+"'"; 
		ResultSet result = statement.executeQuery(query);     
           if(result.next()){
        	   String sql="delete from score where S_NUM= \""+paranB4+"\"and C_NUM=\""+paranB2+"\"and T_NUM= \""+paranB3 +"\"; ";
               statement.executeUpdate(sql);
               out.println("删除学号为:"+paranB4+"的学生");
           }
           else {
               out.println("不存在"+paranB4+",删除失败！！！");
           } 
    %>
     <br><br>
     <a href="open_course-stu-change-end.jsp?paranB2=<%=C_NUM%>&&paranB3=<%=T_NUM%>">查看选课学生数据</a>
     </p>
</body>
</html>