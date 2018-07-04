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
        	
        	response.setContentType("text/html;charset=utf-8");
        	request.setCharacterEncoding("utf-8");
        	
        	Statement stmt = conn.createStatement();
        	String Snum = request.getParameter("Snum");  
        	String Dnum = request.getParameter("Dnum");
        	String Mnum = request.getParameter("Mnum");
        	
        	String Sname= request.getParameter("Sname");  
        	String Sdegree= request.getParameter("Sdegree");
        	String Sidnumber= request.getParameter("Sidcard");

        	String Sschooladdr= request.getParameter("Sschooladdr");  
        	String Shomeaddr= request.getParameter("Shomeaddr");
        	String Sdaybirth= request.getParameter("Sdaybirth");
        	
        	
        	String Ssex= request.getParameter("Ssex");  
        	String Sphone= request.getParameter("Sphone");
        	String Senteryear= request.getParameter("Senteryear");
        	String Min_major= request.getParameter("min_major");
            
            String sql = "update student set D_NUM=? ,M_NUM=?,S_NAME=?,S_DEGREE=?,S_IDCARD=?,S_ROOM=?,S_HOME_ADDR=?,S_BIRTH=?,S_SEX=?,S_PHONE=?,S_ENTER_YEAR=?,MIN_D_NUM=? where S_NUM=? ";

    		PreparedStatement ps2 = (PreparedStatement) conn.prepareStatement(sql);
    		ps2.setString(13, Snum);
    		ps2.setString(1, Dnum);
    		ps2.setString(2,Mnum);
    		ps2.setString(3, Sname);
    		ps2.setString(4, Sdegree);
    		ps2.setString(5,Sidnumber);
    		ps2.setString(6, Sschooladdr);
    		ps2.setString(7, Shomeaddr);
    		ps2.setString(8,Sdaybirth);
    		ps2.setString(9, Ssex);
    		ps2.setString(10, Sphone);
    		ps2.setString(11,Senteryear);
    		ps2.setString(12,Min_major);
    		ps2.execute();
    		ps2.close();
	  
    		conn.close();

          %>
        	 <h4>修改完成</h4>
        	 <a href="search_all_stu.jsp" >查看学生列表</a>
   <%  	}
		catch(Exception e)
		{
        	out.print("信息加载失败！！！");
        	e.printStackTrace();
    	}  
%>
    	 
	</body>
</html>