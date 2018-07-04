   
<%@ page   pageEncoding="utf-8"%>  
<%request.setCharacterEncoding("utf-8");%>  


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>




<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改专业信息反馈以及处理界面</title>
<style type="text/css">

body{
  font-weight:200;
  scroll=no;
    font-size:12px;
}
table{
    margin: 100px auto;
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
    	//out.print("处理信息如下："+"<br/>");
    	//插入同名的内容会自动更新，
        Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
        //out.print("加载数据库驱动成功！！！"+"<br/>");
        String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
    	Connection conn=DriverManager.getConnection(Url);
    	response.setContentType("text/html;charset=utf-8");
    	request.setCharacterEncoding("utf-8");
    	String D_NUM = request.getParameter("D_NUM");  
    	String D_NAME = request.getParameter("D_NAME");
    	//out.print(D_NAME);
    	String D_ADDR = request.getParameter("D_ADDR");
    	String D_PHONE = request.getParameter("D_PHONE");
    	/*String T_COUNT=request.getParameter("T_COUNT");
    	 int a = Integer.valueOf(T_COUNT).intValue();
    	 //out.print(a);
    	String M_COUNT = request.getParameter("M_COUNT");
    	int b = Integer.valueOf(M_COUNT).intValue();
    	//out.print(b);*/
    	
    	String sql = "select * from department where D_NUM=?";
    	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql);
		ptmt.setString(1, D_NUM);
		ResultSet rs = ptmt.executeQuery();
		rs.last();
		int lastRow=rs.getRow();  
		
			String sql22 = "update department set D_NUM=?,D_NAME=?,D_ADDR=?,D_PHONE=? where D_NUM=?";
    		PreparedStatement ps2 = (PreparedStatement) conn.prepareStatement(sql22);
    		ps2.setString(1,D_NUM);
        	ps2.setString(2,D_NAME);
        	ps2.setString(3,D_ADDR);
        	ps2.setString(4,D_PHONE);
        	//ps2.setInt(5,a);
        	//ps2.setInt(6,b);
        	ps2.setString(5,D_NUM);
        	ps2.execute();
    		ps2.close();
		
		conn.close();
    }catch(Exception e){
        out.print("专业信息修改失败！！！"+"<br/>");
       // out.print("请先在users表中填入相应内容！！！");
        e.printStackTrace();
    }
%>    
<br>
<a style=" margin-left:450px;margin-top:40px;" href="department_change.jsp">查看修改后的所有院系的基本信息</a>
 
</body>
</html>