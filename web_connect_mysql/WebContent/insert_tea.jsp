<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<%request.setCharacterEncoding("utf-8");%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>增加新教师</title>
	</head>
	<body>
    	<form  action="add_tea.jsp" method="post">
        	<table align="center" width="450">
            	<tr>
                	<td align="center" colspan="2">
                    	<h2>增加新教师</h2>
                    	<hr>
                	</td>
            	</tr>
            	 <tr>
                	<td align="right">工号：</td>
                	<td><input type="text" name="Tnum" required/></td>
            	</tr>
            	
            	<tr>
                	<td align="right">院系：</td>
                	<td>
                   <select name="Dnum" size="1">
                   <% 
                   try{
                   	Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
               		String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
               		Connection conn=DriverManager.getConnection(Url);
               		Statement stmt = conn.createStatement();
                   	String sql1="select D_NUM, D_NAME from department;"; 
               		PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
               		ResultSet rs = stmt.executeQuery(sql1);
               		while (rs.next())
               		{
               			%><option value=<%=rs.getString(1) %>><%=rs.getString(2)%></option><% 
               		}
               		conn.close();
                   }
                   catch(Exception e)
           		{
                   	out.print("信息加载失败！！！");
                   	e.printStackTrace();
               	}
                   %>
                    </select>
                    </td>
            	</tr>
            	<tr>
                	<td align="right">教师姓名：</td>
                	<td><input type="text" name="Tname" required/></td>
            	</tr>            	
            	<tr>
                	<td align="center" colspan="2">
                    	<input type="submit" value="添加" id="e">
                	</td>
            	</tr>
        	</table>
    	</form>
	</body>
</html>