<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程详情</title>
		 <style type="text/css">

body{
    font-weight:200;
    scroll=no;
    font-size:12px;
}
table{
    margin: 30px auto;
    width:600px;
    font-family:Arial;
    font-weight:200;
    border-collapse:collapse;
    text-align:center;
}
button{
 font-family:Arial;
    text-align:center;
    height: 40px;
    width:80px;
    font-size:15px;
	background-color:#1dabeb; 
	-webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 7px;
    margin-left:500px;
    margin-top:0px;
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
        	
        	response.setContentType("text/html;charset=utf-8");
        	request.setCharacterEncoding("utf-8");
        	
        	Statement stmt = conn.createStatement();
            String Tnum=request.getParameter("Tnum");
            String Dnum=request.getParameter("Dnum");
            String Tname=request.getParameter("Tname");
            
            String sql = "update teacher set D_NUM=? ,T_NAME=? where T_NUM=? ";

    		PreparedStatement ps2 = (PreparedStatement) conn.prepareStatement(sql);
    		ps2.setString(1, Dnum);
    		ps2.setString(2, Tname);
    		ps2.setString(3,Tnum);
    		ps2.execute();
    		ps2.close();
	  
    		conn.close();

          %>
        	 <h4>修改完成</h4>
        	 <a href="search_all_tea.jsp" >查看教师列表</a>
   <%  	}
		catch(Exception e)
		{
        	out.print("信息加载失败！！！");
        	e.printStackTrace();
    	}  
%>
    	 
	</body>
</html>