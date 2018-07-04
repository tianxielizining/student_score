<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.logging.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Date" %>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page import="java.sql.DriverManager" %>
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
<form action="open_course-insert-end.jsp">
     <br><br><br>
        <table border="1" cellspacing="0">
            <tr><th colspan="3">数据表开课信息插入信息</th></tr>
            <tr>
                <td>课程编号</td>
                <td width="500px"><center><input type="text" name="C_NUM" placeholder="不可以为空" /></center></td>
            </tr>
             <tr>
                <td>教师编号</td>
                <td width="500px"><center><input type="text" name="T_NUM" placeholder="不可以为空"/></center></td>
            </tr>
            
             <tr>
                <td>开课学期</td>  
                <td><center>
                <select  name="C_TERM" >
                	    <option value="12春季学期">12春季学期</option>
                		<option value="12夏季学期">12夏季学期</option>
                		<option value="12秋季学期">12秋季学期</option>
                		<option value="13春季学期">13春季学期</option>
                		<option value="13夏季学期">13夏季学期</option>
                		<option value="13秋季学期">13秋季学期</option>
                		<option value="14春季学期">14春季学期</option>
                		<option value="14夏季学期">14夏季学期</option>
                		<option value="14秋季学期">14秋季学期</option>
                		<option value="15春季学期">15春季学期</option>
                		<option value="15夏季学期">15夏季学期</option>
                		<option value="15秋季学期">15秋季学期</option>         		
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
     	<p><a href="open_course-insert.jsp">继续插入新开设课程</a></p>
       	<p><a href="open_course-select.jsp">查看开设课程信息</a></p>
    </div> 

</body>
</html>
