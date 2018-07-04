<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html >
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>院系详细信息</title>
		<style type="text/css">

body{
    font-weight:200;
    scroll=no;
    font-size:12px;
}
table{
    margin: 90px auto;
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
button{
 font-family:Arial;
    text-align:center;
    height: 30px;
    width:90px;
    font-size:15px;
    color:white;
	background-color:#1dabeb; 
	-webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 7px;
    margin-left:490px;
    margin-top:0px;
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
        	response.setContentType("text/html;charset=utf-8");
        	request.setCharacterEncoding("utf-8");
        	String sql1="select D_NUM,D_NAME,D_ADDR,D_PHONE from department ;"; 
        	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs = stmt.executeQuery(sql1);  
        	int i=0;
        	String[] jilu1=new String[100];//用该数组记录每一项的院系编号
        	String[] jilu2=new String[100];
        	String[] jilu3=new String[100];
        	String[] jilu4=new String[100];
        	int[] jilu5=new int[100];
        	int[] jilu6=new int[100];
        	while(rs.next()){
        		i++;
        		jilu1[i]=rs.getString(1);
        		jilu2[i]=rs.getString(2);
        		jilu3[i]=rs.getString(3);
        		jilu4[i]=rs.getString(4);
        		//out.print(jilu1[i]+" "+jilu2[i]+" "+jilu3[i]+" "+jilu4[i]);
        		/*String sql2="select count(*) as M_COUNT from major where major.D_NUM= \""+jilu1[i]+"\";";
            	PreparedStatement ptmt1 = (PreparedStatement) conn.prepareStatement(sql2);
            	ResultSet rs2 = stmt.executeQuery(sql2);
            	while(rs2.next()){
            		jilu5[i]=rs2.getInt(1);
            	}
            	//jilu5[i]=rs2.getInt(1);
            	String sql3="select count(*) as T_COUNT from teacher where teacher.D_NUM=\""+jilu1[i]+"\";";
            	PreparedStatement ptmt2 = (PreparedStatement) conn.prepareStatement(sql3);
            	ResultSet rs3 = stmt.executeQuery(sql3);
            	while(rs3.next()){
            		jilu6[i]=rs3.getInt(1);
            	}
            	//jilu6[i]=rs3.getInt(1);
        		out.print(jilu1[i]+" "+jilu2[i]+" "+jilu3[i]+" "+jilu4[i]+" "+jilu5[i]+" "+jilu6[i]+" ");*/
        	}; //记录一共有多少项
        	//out.print(i);
        	for(int j=1;j<=i;j++){
        		String sql2="select count(*) as M_COUNT from major where major.D_NUM= \""+jilu1[j]+"\";";
            	PreparedStatement ptmt1 = (PreparedStatement) conn.prepareStatement(sql2);
            	ResultSet rs2 = stmt.executeQuery(sql2);
            	while(rs2.next()){
            		jilu5[j]=rs2.getInt(1);
            	}
            	//out.print(jilu5[j]);
        	}
        	for(int m=1;m<=i;m++){
        		String sql3="select count(*) as T_COUNT from teacher where teacher.D_NUM=\""+jilu1[m]+"\";";
            	PreparedStatement ptmt2 = (PreparedStatement) conn.prepareStatement(sql3);
            	ResultSet rs3 = stmt.executeQuery(sql3);
            	while(rs3.next()){
            		jilu6[m]=rs3.getInt(1);
            	}
            	//out.print(jilu6[m]);
        	}
        	/*while(i>=1){
        		out.print(jilu1[i]+" "+jilu2[i]+" "+jilu3[i]+" "+jilu4[i]+" "+jilu5[i]+" "+jilu6[i]+" ");
        		i--;
        	}*/
%>

			<table  border="1" class="table1">
			<tr>
				<th>
        		<%out.print("院系编号"); %>         		
        		</th>
        		<th>
        		<%out.print("院系名称");%>
        		</th>
        		<th>
        		<% out.print("院系地址");%>
        		</th>
				<th>
				<% out.print("办公电话");%>
				</th>
				<th>
				<% out.print("专业数量");%>
				</th>
				<th>
				<%out.print("教师人数");%>
				</th>
				<th>	
				<%out.print("修改");%>
				</th>
				<th>	
				<%out.print("删除");%>
				</th>
        	</tr>
        	<%
        	//out.print("lalala");
        	//out.print(i);
        	int x=1;
        	while(x<=i) {   
        		
        	%>
        	<tr>
        		<th>
        		<%
  					
        			out.print(jilu1[x]+" ");   
        		%>
        		</th>
        		<th>
        		<a style=" background-color:white;color:black;" href="major_change.jsp?department=<%=jilu1[x]%>" >
        		<%
        			out.print(jilu2[x]+" ");   
        		%></a>
        		</th>
        		<th>
        		<%
        			out.print(jilu3[x]+" ");   
        		%>
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
        		<a href="department_change_modify_1.jsp?departmentnum=<%=jilu1[x] %>&departmentphone=<%=jilu4[x]%>&tcount=<%=jilu5[x]%>&mcount=<%=jilu6[x]%>" >
        		<%
        			out.print("修改");   
        		%></a>
        		</th>
        		<th>
    		
        		<a style=" background-color:#d01b24;" href="department_change_delete.jsp?department=<%=jilu1[x]%>"onclick="return confirm('确定将此记录删除?')" >
        		<%
        			out.print("删除");   
        		%></a>
        		</th><% 
        		x++;
        	}   
        	%>
        	</table>
        <%
        	conn.close();
    	}
		catch(Exception e)
		{
        	out.print("异常！！！");
        	e.printStackTrace();
    	}
		%> 		
<!--<a style=" left:450px;margin-top:70px;" href="department_change.html">返回上一页面</a>-->
<a style=" margin-left:500px;margin-top:20px;" href="department_change_add.html">增加院系</a>

	</body>
</html>