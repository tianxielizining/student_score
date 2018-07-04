<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<%request.setCharacterEncoding("utf-8");%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>增加新学生</title>
	</head>
	<body>
    	<form  action="add_stu.jsp" method="post">
        	<table align="center" width="450">
            	<tr>
                	<td align="center" colspan="2">
                    	<h2>增加新学生</h2>
                    	<hr>
                	</td>
            	</tr>
            	 <tr>
                	<td align="right">学号：</td>
                	<td><input type="text" name="Snum"/></td>
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
                	<td align="right">专业：</td>
                	<td>
                   <select name="Mnum" size="1">
                   <% 
                 //  String Dnum = request.getParameter("Dnum");
                   
                   try{
                   	Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
               		String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
               		Connection conn=DriverManager.getConnection(Url);
               		Statement stmt = conn.createStatement();
                   	String sql1="select M_NUM, M_NAME from major;";// where D_NUM="+Dnum+";"; 
                   	
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
                	<td align="right">姓名：</td>
                	<td><input type="text" name="Sname" required/></td>
            	</tr>
            	
            	<tr>
                	<td align="right">学位：</td>
                	<td>
                	<!--  <input type="text" name="Sdegree"required/>-->
                	<select name="Sdegree" size="1">
                		<option value="本科">本科</option>
                		<option value="硕士">硕士</option>
                		<option value="博士">博士</option>
                	</select>
                	</td>
            	</tr>      
            	<tr>
                	<td align="right">身份证号：</td>
                	<td>
                	<input name="Sidnumber" id="CardId" type="text"  required pattern="^([0-9]){18}(x|X)?$" oninvalid="this.setCustomValidity('请输入合法的身份证号');" oninput="setCustomValidity('')">
                	<!--  <input type="text" id="idnumber" name="Sidnumber" />-->
                	</td>
            	</tr>   
            	<tr>
                	<td align="right">宿舍住址：</td>
                	<td><input type="text" name="Sschooladdr"required/></td>
            	</tr>   
            	<tr>
                	<td align="right">家庭住址：</td>
                	<td><input type="text" name="Shomeaddr"required/></td>
            	</tr>   
            	<tr>
                	<td align="right">出生日期：</td>
                	<td><input type="date" name="Sdaybirth"required/></td>
            	</tr>   
            	<tr>
                	<td align="right">学生性别：</td>
                	<td>
                	<!--  <input type="text" name="Ssex"required/>-->
                	<select name="Ssex" size="1">
                	<option value="男">男</option>
                	<option value="女">女</option>
                	</select>
                	</td>
            	</tr>      
            	<tr>
                	<td align="right">学生电话：</td>
                	<td>
                	<!--  <input type="text" name="Sphone"required/>-->
                	    <input id="private_phone" name="Sphone" pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" oninvalid="this.setCustomValidity('请输入合法的手机号');" oninput="setCustomValidity('')"type="text"required  />  
                	
                	
                	</td>
            	</tr>   
            	<tr>
                	<td align="right">入学年份：</td>
                	<td><input type="number"  min="2010" max="2020" name="Senteryear"required/></td>
            	</tr>   
            	   	
            	
            	<tr>
                	<td align="right">辅修院系：</td>
                	<td>
                	<!--  <input type="text" name="Ssex"required/>-->
                	<select name="min_major" size="1">
                	<option value="无">无</option>
                	 <% 
                   try{
                   	Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
               		String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
               		Connection conn=DriverManager.getConnection(Url);
               		Statement stmt = conn.createStatement();
                   	String sql1="select D_NUM,D_NAME from department;"; 
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
                	<td align="center" colspan="2">
                    	<input type="submit" value="添加" id="e">
                	</td>
            	</tr>
        	</table>
    	</form>
	</body>
	<script>
</script>
</html>