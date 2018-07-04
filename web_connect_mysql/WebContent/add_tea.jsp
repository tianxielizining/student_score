<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add User Person</title>
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
    		
        	String Dnum = request.getParameter("Dnum");  
        	String Tnum = request.getParameter("Tnum");
        	String Tname = request.getParameter("Tname");
       		
        	
        	String sql1="select * from teacher where T_NUM=\""+Tnum+"\";"; 
        	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs = stmt.executeQuery(sql1);  
        	boolean HasNextData=rs.next();
        	if (HasNextData==true) {out.print("<script>alert('该工号已存在！');window.location.href='insert_tea.jsp'</script>");}

        	
        	
            String sql12="insert into teacher(D_NUM,T_NUM,T_NAME) values(?,?,?)";
            PreparedStatement ps12=conn.prepareStatement(sql12);
            ps12.setString(1,Dnum);
            ps12.setString(2,Tnum);
            ps12.setString(3,Tname);
           	ps12.execute();
        	ps12.close();
			%>
        	<h4>增加成功</h4>
        	<a href="search_all_tea.jsp">查看增加结果</a>
   
        	<%
        	conn.close();
        	%><a href="query.jsp">查询</a></br><% 
    	}
		catch(Exception e)
		{
        	out.print("失败");
        	e.printStackTrace();
    	}
%> 
	</body>
</html>