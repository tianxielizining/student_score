  
<%@ page   pageEncoding="utf-8"%>  
<%request.setCharacterEncoding("utf-8");%>  


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>

<%request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加院系所属专业的信息处理和反馈页面</title>
<style type="text/css">

body{
  font-weight:200;
  scroll=no;
    font-size:12px;
}
table{
    margin: 80px auto;
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
        //创建connection连接，
        //out.print("创建connection连接成功！！！"+"<br/>");
      response.setContentType("text/html;charset=utf-8");
        	request.setCharacterEncoding("utf-8");
    	String M_NUM = request.getParameter("M_NUM");  
    	String D_NUM = request.getParameter("D_NUM");
    	String M_NAME = request.getParameter("M_NAME");
    	
    	String UNDER_CREDIT = request.getParameter("UNDER_CREDIT");
    	//out.print(UNDER_CREDIT);
    	int a = Integer.valueOf(UNDER_CREDIT).intValue();
    	//out.print(a);
    	String POST_CREDIT = request.getParameter("POST_CREDIT");
    	//out.print(POST_CREDIT);
    	int b = Integer.valueOf(POST_CREDIT).intValue();
    	//out.print(b);
    	
    	
    	
    	String DOCTOR_CREDIT = request.getParameter("DOCTOR_CREDIT");
    	//out.print(DOCTOR_CREDIT);
    	int c = Integer.valueOf(DOCTOR_CREDIT).intValue();
    	//Sout.print(c);
    	
    	String sql = "select * from major where M_NUM=?";
    	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql);
		ptmt.setString(1, M_NUM);
		ResultSet rs = ptmt.executeQuery();
		rs.last();
		int lastRow=rs.getRow();  
		if(lastRow==0) {
			String sql12="insert into major(M_NUM,D_NUM,M_NAME,UNDER_CREDIT,POST_CREDIT,DOCTOR_CREDIT) values(?,?,?,?,?,?) ";
        	PreparedStatement ps12=conn.prepareStatement(sql12);
        	ps12.setString(1,M_NUM);
        	ps12.setString(2,D_NUM);
        	ps12.setString(3,M_NAME);
        	ps12.setInt(4,a);
        	ps12.setInt(5,b);
        	ps12.setInt(6,c);
        	ps12.execute();
    		ps12.close();
		}
		else{%>
			<script type="text/javascript">
			alert("专业编号输入重复！！！");
			window.location.href="major_change_add_first.jsp?department=<%=D_NUM%>";   
		</script>
			<% 
			/*String sql22 = "update major set M_NUM=?,D_NUM=?,M_NAME=?,UNDER_CREDIT=?,POST_CREDIT=?,DOCTOR_CREDIT=? where M_NUM=?";

    		PreparedStatement ps2 = (PreparedStatement) conn.prepareStatement(sql22);
    		ps2.setString(1,M_NUM);
        	ps2.setString(2,D_NUM);
        	ps2.setString(3,M_NAME);
        	ps2.setInt(4,a);
        	ps2.setInt(5,b);
        	ps2.setInt(6,c);
        	ps2.setString(7,M_NUM);
        	ps2.execute();
    		ps2.close();*/
		}%>
		<a style=" margin-left:450px;margin-top:40px;" href="major_change_add_first.jsp?department=<%=D_NUM%>">继续插入新的专业信息</a> 
		</br>
		<a style="margin-left:450px;margin-top:50px;" href="major_change.jsp?department=<%=D_NUM%>">返回该专业所属院系的专业详情界面</a>
		<% 
		conn.close();
    }catch(Exception e){
        out.print("专业信息添加失败！！！"+"<br/>");
       // out.print("请先在users表中填入相应内容！！！");
        e.printStackTrace();
    }
%>    
 
</body>
</html>