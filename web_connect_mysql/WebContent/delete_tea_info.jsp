<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程详情</title>
	</head>
	<body>
<%
    try{
    		Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
        	String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
        	Connection conn=DriverManager.getConnection(Url);
        	Statement stmt = conn.createStatement();
            String Tnum=request.getParameter("Tnum");
            String Dnum=request.getParameter("Dnum");
          //  String Dname=request.getParameter("Dname");
          //  String Tname=  request.getParameter("Tname");
            
          	String sql1="select D_NAME from department where D_NUM=\""+Dnum+"\";"; 
        	PreparedStatement ptmt1 = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs1 = stmt.executeQuery(sql1);  
          	rs1.next();
          	String Dname=rs1.getString(1);
          	
          	String sql2="select T_NAME from teacher where T_NUM=\""+Tnum+"\";"; 
        	PreparedStatement ptmt2 = (PreparedStatement) conn.prepareStatement(sql2);
        	ResultSet rs2 = stmt.executeQuery(sql2);  
          	rs2.next();
          	String Tname=rs2.getString(1);
            %>
            <h3>您要删除的基本信息如下：</h3>
            <h4>教师工号：<%=Tnum%></h4>
            <h4>所在院系：<%=Dname%></h4>
            <h4>教师姓名：<%=Tname%></h4>
            <%
            
            String sql11 = "delete from teacher where T_NUM =?";
    		PreparedStatement ps11 = (PreparedStatement) conn.prepareStatement(sql11);
    		ps11.setString(1, Tnum);
    		//out.print(ps11);
    		ps11.execute();
    		//int row11=ps11.executeUpdate();
    		ps11.close();
    	  
        	conn.close();%>
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