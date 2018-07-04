<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改学生信息</title>
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
        String Snum=request.getParameter("Snum");
        String Dnum=request.getParameter("Dnum");
        String Mnum=request.getParameter("Mnum");
        
        String sql1="select D_NAME from department where D_NUM=\""+Dnum+"\";"; 
    	PreparedStatement ptmt1 = (PreparedStatement) conn.prepareStatement(sql1);
    	ResultSet rs1 = stmt.executeQuery(sql1);  
      	rs1.next();
      	String Dname=rs1.getString(1);
      	

      	
      	String sql3="select M_NAME from major where M_NUM=\""+Mnum+"\";"; 
    	PreparedStatement ptmt3 = (PreparedStatement) conn.prepareStatement(sql3);
    	ResultSet rs3 = stmt.executeQuery(sql3);  
      	rs3.next();
      	String Mname=rs3.getString(1);
      	
      	String sql4="select S_NAME,S_DEGREE,S_IDCARD,S_ROOM,S_HOME_ADDR,S_BIRTH,S_SEX,S_PHONE,S_ENTER_YEAR,MIN_D_NUM from student where S_NUM=\""+Snum+"\";";
      	PreparedStatement ptmt4 = (PreparedStatement) conn.prepareStatement(sql4);
    	ResultSet rs4 = stmt.executeQuery(sql4);  
      	rs4.next();
      	String Sname=rs4.getString(1);
      	String Sdegree=rs4.getString(2);
      	String Sidcard=rs4.getString(3);
      	String Sroom=rs4.getString(4);
      	String Shomeaddr=rs4.getString(5);
      	String Sbirth=rs4.getString(6);
      	String Ssex=rs4.getString(7);
      	String Sphone=rs4.getString(8);
      	String Senteryear=rs4.getString(9);
      	String Mindnum=rs4.getString(10);
      	
      	
            %>
            
            <form  action="change_stu_info.jsp" method="post" >
        	<table  width="450">
        		<tr>
                	<td><h4>学号：</td>
                	<td><input type="text" name="Snum" value="<%=Snum%>"readonly="true"/></h4></td>
            	</tr>
        		<tr>
                	<td><h4>院系：</td>
                	<td>
                   <select name="Dnum" size="1" value="<%=Dname%>">
                   <% 
                   try{
                   	String sql11="select D_NUM, D_NAME from department;"; 
               		PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql11);
               		ResultSet rs = stmt.executeQuery(sql11);
               		%><option value=<%=Dnum %>><%=Dname%></option><% 
               		while (rs.next())
               		{
               			%><option value=<%=rs.getString(1) %>><%=rs.getString(2)%></option><% 
               		}
               		//conn.close();
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
                	<td >专业：</td>
                	<td>
                   <select name="Mnum" size="1">
                   <% 
                   try{
                   	Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
               		String Url2="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
               		Connection conn2=DriverManager.getConnection(Url2);
               		Statement stmt2 = conn2.createStatement();
                   	String sql12="select M_NUM, M_NAME from major;"; 
               		PreparedStatement ptmt = (PreparedStatement) conn2.prepareStatement(sql12);
               		ResultSet rs = stmt2.executeQuery(sql12);
               		%><option value=<%=Mnum %>><%=Mname%></option><% 
               		while (rs.next())
               		{
               			%><option value=<%=rs.getString(1) %>><%=rs.getString(2)%></option><% 
               		}
               		//conn.close();
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
                	<td><h4>姓名：</td>
                	<td><input type="text" name="Sname" value="<%=Sname%>"/></h4></td>
            	</tr>
                <tr>
                	<td><h4>学位：</td>
                	<td><input type="text" name="Sdegree" value="<%=Sdegree%>"/></h4></td>
            	</tr>
                <tr>
                	<td><h4>身份证号：</td>
                	<td>
                	
                	<!--  <input type="text" name="Sidcard" value="<%//=Sidcard%>"/>-->
                	<input name="Sidcard" id="CardId" value="<%=Sidcard%> "type="text"  required pattern="^([0-9]){18}(x|X)?$" oninvalid="this.setCustomValidity('请输入合法的身份证号');" oninput="setCustomValidity('')">
                	
                	</h4>
                	</td>
            	</tr>
                <tr>
                	<td><h4>宿舍地址：</td>
                	<td><input type="text" name="Sschooladdr" value="<%=Sroom%>"/></h4></td>
            	</tr>
                <tr>
                	<td><h4>家庭住址：</td>
                	<td><input type="text" name="Shomeaddr" value="<%=Shomeaddr%>"/></h4></td>
            	</tr>
                <tr>
                	<td><h4>出生日期：</td>
                	<td><input type="date" name="Sdaybirth" value="<%=Sbirth%>"/></h4></td>
            	</tr>
                <tr>
                	<td><h4>性别：</td>
                	<td><input type="text" name="Ssex" value="<%=Ssex%>"/></h4></td>
            	</tr>
                <tr>
                	<td><h4>电话号码：</td>
                	<td>
                <!-- 	<input type="text" name="Sphone" value="<%//=Sphone%>"/></h4> -->
                	<input type="text" value="<%=Sphone%>" id="private_phone" name="Sphone" pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" oninvalid="this.setCustomValidity('请输入合法的手机号');" oninput="setCustomValidity('')"type="text"required  />  
                	
                	</td>
            	</tr>
                <tr>
                	<td><h4>入学年份：</td>
                	<td><input type="text" name="Senteryear" value="<%=Senteryear%>"/></h4></td>
            	</tr>
            	<tr>
                	<td ><h4>辅修院系：</td>
                	<td>
                
                	<select name="min_major" size="1">
                	<option value=<%=Mindnum%>><%=Mindnum%></option>
                	<option value="无">无</option>
                	 <% 
                   try{
                   	Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
               		String Url3="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
               		Connection conn3=DriverManager.getConnection(Url3);
               		Statement stmt2 = conn3.createStatement();
                   	String sql5="select D_NUM,D_NAME from department;"; 
               		PreparedStatement ptmt = (PreparedStatement) conn3.prepareStatement(sql5);
               		ResultSet rs = stmt2.executeQuery(sql5);
               		while (rs.next())
               		{
               			%><option value=<%=rs.getString(1) %>><%=rs.getString(1)+rs.getString(2)%></option><% 
               		}
               		conn3.close();
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
        	</table>
        	 <button  type="submit" id="s">更改</button>  
    	   </form>
    	   <%
        	conn.close();
    	}
		catch(Exception e)
		{
        	out.print("信息加载失败！！！");
        	e.printStackTrace();
    	}%>
	</body>
</html>