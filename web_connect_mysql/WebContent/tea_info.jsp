<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>所查教师信息</title>
		<style type="text/css">

body{
    font-weight:200;
    font-size:12px;
}
p{
padding-top:100px;
}

h1{
padding-top:100px;
font-size:13px;
padding-left:340px;
}
h2{
padding-top:0px;
font-size:13px;
padding-left:340px;
}
h3{
padding-top:0px;
font-size:13px;
padding-left:340px;
}
h4{
padding-top:0px;
font-size:13px;
padding-left:340px;
}
table{
    /*margin: 90px auto;*/
    margin:auto;
    padding-top:200px;
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
	<body>
<%
    try{
    		Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
        	String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
        	Connection conn=DriverManager.getConnection(Url);
        	Statement stmt = conn.createStatement();
            String tnum=request.getParameter("u");
        	String sql1="select T_NUM, D_NAME,T_NAME from teacher,department where T_NUM=\""+tnum+"\" and teacher.D_NUM=department.D_NUM;"; 
        	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs = stmt.executeQuery(sql1);  
        	boolean HasNextData=rs.next();
        	if (HasNextData==false) {out.print("<script>alert('用户不存在！');window.location.href='login_tea.html'</script>");}
        	//rs.next();
        	else{
            %><h1>教师工号：<% out.print(rs.getString(1)+" ");   %></h1><%
            %><h2>所在院系：<% out.print(rs.getString(2)+" ");   %></h2><%
            %><h3>教师姓名：<% out.print(rs.getString(3)+" ");   %></h3><%
        	}
            String sql2="select C_TERM,C_NAME,open_course.C_NUM from open_course,course where T_NUM=\""+tnum+"\" and open_course.C_NUM=course.C_NUM;"; 
            PreparedStatement ptmt2 = (PreparedStatement) conn.prepareStatement(sql2);
    		//ptmt2.setString(1, tnum);
        	ResultSet rs2 = stmt.executeQuery(sql2);   
            
        	%>
        	<h4>所授课程:</h4>
        	<table border="1"><%
        	%><tr><%
        		%><th><%
        			out.print("开课学期");          		
        		%></th><%
        		%><th><%
        			out.print("课程名称");       
        		%></th><%
        	%></tr><%
        	while(rs2.next()) {   
        	%><tr><%
        		%><th>
        		<%
        			out.print(rs2.getString(1)+" ");   
        			%>
        		</th><%
        		%><th>
        		<%%> 
        			<a style="background-color:white;color:black;" href="search_stu_score.jsp?tea=<%=tnum %>&course=<%=rs2.getString(3)%>" ><%
        			out.print(rs2.getString(2)+" ");    
        		%></a></th><%
            %></tr><%
        	}   
        	%></table><%
        	conn.close();
    	}
		catch(Exception e)
		{
        	out.print("信息加载失败！！！");
        	e.printStackTrace();
    	}
%> 		<a style="margin-left:470px;margin-top:30px;" href="login_tea.html">查询其他教师</a>
	</body>
</html>