
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>学生详情</title>
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
        	
        	response.setContentType("text/html;charset=utf-8");
        	request.setCharacterEncoding("utf-8");
        	
        	Statement stmt = conn.createStatement();
        	String sql1="select S_NUM, D_NAME,M_NAME,S_NAME,S_DEGREE,S_IDCARD,S_ROOM,S_HOME_ADDR,S_BIRTH,S_SEX,S_PHONE,S_ENTER_YEAR,student.D_NUM,student.M_NUM,MIN_D_NUM from student,department,major where student.D_NUM=department.D_NUM and student.M_NUM=major.M_NUM;";
        	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs = stmt.executeQuery(sql1);   
            
        	%><table border="1"><%
        	%><tr><%
        		%><th><%
        			out.print("学生学号");          		
        		%></th><%
        		%><th><%
        			out.print("所在院系");       
        		%></th><%
        		%><th><%
    			out.print("所学专业");       
    			%></th><%
    			%><th><%
    			out.print("学生姓名");       
    			%></th><%
    			%><th><%
    			out.print("学生学位");       
    			%></th><%
    			%><th><%
    			out.print("身份证号");       
    			%></th><%
    			%><th><%
    			out.print("宿舍地址");       
    			%></th><%
    			%><th><%
    			out.print("家庭住址");       
    			%></th><%
    			%><th><%
    			out.print("出生日期");       
    			%></th><%
    			%><th><%
    			out.print("学生性别");       
    			%></th><%
    			%><th><%
    			out.print("学生电话");       
    			%></th><%
    			%><th><%
    			out.print("入学年份");       
    			%></th><%
    			%><th><%
    			out.print("辅修院系代码");       
    			%></th><%
    			%><th><%
    			out.print("修改");       
    			%></th><%
    			%><th><%
    			out.print("删除");       
    			%></th><%
        	%></tr><%
        	while(rs.next()) {   
        	%><tr><%
        		%><th>
        		<%
        			out.print(rs.getString(1)+" ");   
        			%>
        		</th><%
        		%><th>
        		 
        		<%
        			out.print(rs.getString(2)+" ");    
        		%></th><%
        		%><th>
       		 
        		<%
        			out.print(rs.getString(3)+" ");    
        		%></th><%
        		%><th>
        		
        	
       		 
        		<%
        			out.print(rs.getString(4)+" ");    
        		%></th><%
        		%><th>
        		
        		
       		 
        		<%
        			out.print(rs.getString(5)+" ");    
        		%></th><%
        		%><th>
        		
        		
       		 
        		<%
        			out.print(rs.getString(6)+" ");    
        		%></th><%
        		%><th>
        		
        		
       		 
        		<%
        			out.print(rs.getString(7)+" ");    
        		%></th><%
        		%><th>
        		
        		
       		 
        		<%
        			out.print(rs.getString(8)+" ");    
        		%></th><%
        		%><th>
        		
        		
       		 
        		<%
        			out.print(rs.getString(9)+" ");    
        		%></th><%
        		%><th>
        		
        		
       		 
        		<%
        			out.print(rs.getString(10)+" ");    
        		%></th><%
        		%><th>
        		
        		
       		 
        		<%
        			out.print(rs.getString(11)+" ");    
        		%></th><%
        		%><th>
        		
        		
       		 
        		<%
        			out.print(rs.getString(12)); 
 
        		%></th><%
        		%><th>
        		
        		
          		 
        		<%
        			out.print(rs.getString(15));    
        		%></th><%
        		%><th>
          		 
        		
        		<a href="student_update.jsp?Snum=<%=rs.getString(1) %>&Dnum=<%=rs.getString(13)%>&Mnum=<%=rs.getString(14)%>" >
				修改
				</a>   
        		</th><%
        		%><th>
          		 
        		<a style=" background-color:#d01b24;" href="student_delete.jsp?Snum=<%=rs.getString(1) %>"onclick="return confirm('确定将此记录删除?')" >
					删除
					</a>   
					</th><%
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
%> 		<a href="student_insert.jsp">增加新学生</a>
	</body>
</html>