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
            String Tnum=request.getParameter("Tnum");
            String Cnum=request.getParameter("Cnum");
            String Snum=request.getParameter("Snum");
            String newscores=  request.getParameter("newscore");
            int newscore=Integer.valueOf(newscores);
            %>
            <h3>您要修改的基本信息如下：</h3>
            <h4>教师工号：<%=Tnum%></h4>
            <h4>课程名：<%=Cnum%></h4>
            <h4>学生学号：<%=Snum%></h4>
            <h4>现有成绩：<%=newscore%></h4>
            <%
            String sql1="select C_CREDIT from course  where C_NUM=\""+Cnum+"\" ;"; 
        	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs = stmt.executeQuery(sql1);  
        	rs.next();
        	int sccredit=0;
        	int ccredit=rs.getInt(1);
            if (newscore>=60)  sccredit=ccredit;
            String sql = "update score set S_SCORE=? , S_C_CREDIT =? where S_NUM=? and T_NUM=? and C_NUM=? ";

        		PreparedStatement ps2 = (PreparedStatement) conn.prepareStatement(sql);
        		ps2.setInt(1, newscore);
        		ps2.setInt(2, sccredit);
        		ps2.setString(3,Snum);
        		ps2.setString(4,Tnum);
        		ps2.setString(5,Cnum);
        		ps2.execute();
        		ps2.close();
    	  
        	conn.close();%>
        	 <a href="search_stu_score.jsp?tea=<%=Tnum %>&course=<%=Cnum%>" >查询修改结果</a>
   <%  	}
		catch(Exception e)
		{
        	out.print("信息加载失败！！！");
        	e.printStackTrace();
    	}  
%>
    	 
	</body>
</html>