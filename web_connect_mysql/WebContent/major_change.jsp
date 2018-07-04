    
<%@ page   pageEncoding="utf-8"%>  
<%request.setCharacterEncoding("utf-8");%>  

<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>专业详细信息</title>
		<style type="text/css">

body{
    font-weight:200;
    scroll=no;
    font-size:12px;
}
table{
    margin: 170px auto;
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
        	String department=request.getParameter("department");
        	String sql1="select M_NUM,D_NUM,M_NAME,UNDER_CREDIT,POST_CREDIT,DOCTOR_CREDIT from major where D_NUM=\""+department+"\";"; 
        	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs = stmt.executeQuery(sql1);  
        	int i=0;
        	String[] jilu1=new String[100];//用该数组记录每一项的院系编号
        	String[] jilu2=new String[100];
        	String[] jilu3=new String[100];
        	int[] jilu4=new int[100];
        	int[] jilu5=new int[100];
        	int[] jilu6=new int[100];
        	while(rs.next()){
        		i++;
        		jilu1[i]=rs.getString(1);
        		jilu2[i]=rs.getString(2);
        		jilu3[i]=rs.getString(3);	
        		jilu4[i]=rs.getInt(4);
        		jilu5[i]=rs.getInt(5);
        		jilu6[i]=rs.getInt(6);
        	}
        	//out.print(i);
        	String abc;
        	abc=jilu2[1];
        	//out.print(abc);
%>
			<table  border="1" class="table1">
			<tr>
				<th>
        			<%out.print("专业编号"); %>         		
        		</th>
        		<th><%
        			out.print("院系编号");%>
        		</th>
        		<th>
        		<% out.print("专业名称");%>
        		</th>
				<th>
				<% out.print("本科生需修学分");%>
				</th>
				<th>
				<% out.print("研究生需修学分");%>
				</th>
				<th>
				<%out.print("博士生需修学分");%>
				</th>
				<th>	
				<%out.print("修改");%>
				</th>
				<th>	
				<%out.print("删除");%>
				</th>
        	</tr>
        	<%
        	int x=1;
        	while(x<=i)  {   
        	%>
        	<tr>
        		<th>
        		
        		<%
        			out.print(jilu1[x]+" "); 
        		%>
        		</th>
        		<th>
        		<%
        			out.print(jilu2[x]+" "); 
        		%>
        		</th>
        		<th>
        		<a href="major_student.jsp?major=<%=jilu1[x]%>" >
        		<%
        			out.print(jilu3[x]+" ");    
        		%></a>
        		</th>
        		<th>
        		<%
        			out.print(jilu4[x]+" ");     
        		%>
        		</th>
        		<th>
        		<%
        			out.print(jilu5[x]+" ");    
        		%>
        		</th>
        		<th>
        		<%
        			out.print(jilu6[x]+" ");   
        		%>
        		</th>
        		<th>
        		<a href="major_change_modify_1.jsp?majornum=<%=jilu1[x]%> &departmentnum=<%=jilu2[x]%>&under=<%=jilu4[x]%>&post=<%=jilu5[x]%>&doctor=<%=jilu6[x]%>" >
        		<%
        			out.print("修改");   
        		%></a>
        		</th>
        		<th>
        		<a style=" background-color:#d01b24;" href="major_change_delete.jsp?major=<%=jilu1[x]%>"onclick="return confirm('确定将此记录删除?')" >
        		<%
        			out.print("删除");   
        		%></a>
        		</th><% 
        		x++;
        	}   
        	%>
        	</table>
  		<a href="department_change.jsp">返回上一页面</a> 
        <a href="major_change_add_first.jsp?department=<%=department%>">添加专业</a>
        <%
        	conn.close();
    	}
		catch(Exception e)
		{
        	out.print("信息加载失败！！！");
        	e.printStackTrace();
    	}
		%> 		
      
	</body>
</html>