<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>所查学生信息</title>
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
		h1{
		padding-top:3px;
		padding-left:400px;
		font-size:13px;
		}
		h4{
		padding-left:300px;
		padding-top:30px;
		font-size:13px;
		}
		/*
		h2{
		padding-top:0px;
		padding-left:500px;
		font-size:13px;
		}
		
		h3{
		padding-top:0px;
		padding-left:70px;
		font-size:13px;
		}
		h4{
		padding-top:0px;
		padding-left:70px;
		font-size:13px;
		}
		h5{
		padding-top:0px;
		padding-left:70px;
		font-size:13px;
		}
		h6{
		padding-top:0px;
		padding-left:70px;
		font-size:13px;
		}
		h7{
		padding-top:0px;
		padding-left:170px;
		font-size:13px;
		}
		h8{
		padding-top:0px;
		padding-left:170px;
		font-size:13px;
		}
		h9{
		padding-top:0px;
		padding-left:170px;
		font-size:13px;
		}
		h10{
		padding-top:0px;
		padding-left:170px;
		font-size:13px;
		}
		h11{
		padding-top:0px;
		padding-left:170px;
		font-size:13px;
		}
		h12{
		padding-top:0px;
		padding-left:170px;
		font-size:13px;
		}*/
		</style>
	</head>
	<body>
<%
    try{
    		Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
        	String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
        	Connection conn=DriverManager.getConnection(Url);
        	Statement stmt = conn.createStatement();
            String snum=request.getParameter("u");
        	String sql1="select S_NUM, D_NAME,M_NAME,S_NAME,S_DEGREE,S_IDCARD,S_ROOM,S_HOME_ADDR,S_BIRTH,S_SEX,S_PHONE,S_ENTER_YEAR,student.M_NUM,student.D_NUM,MIN_D_NUM from student,department,major where S_NUM=\""+snum+"\" and student.D_NUM=department.D_NUM and student.M_NUM=major.M_NUM;"; 
        	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs = stmt.executeQuery(sql1);  
        	boolean HasNextData=rs.next();
        	//out.print(sql1);
         	if (HasNextData==false) {out.print("<script>alert('用户不存在！');window.location.href='login_stu.html'</script>");}
        	else{
        	//rs.next();
            %><h1>学生学号：<% out.print(rs.getString(1)+" ");   %></h1><%
            %><h1>所在院系：<% out.print(rs.getString(2)+" ");   %></h1><%
            %><h1>所学专业：<% out.print(rs.getString(3)+" ");   %></h1><%
        	%><h1>学生姓名：<% out.print(rs.getString(4)+" ");   %></h1><%
            %><h1>学生学位：<% out.print(rs.getString(5)+" ");   %></h1><%
            %><h1>身份证号：<% out.print(rs.getString(6)+" ");   %></h1><%
            %><h1>宿舍地址：<% out.print(rs.getString(7)+" ");   %></h1><%
            %><h1>家庭住址：<% out.print(rs.getString(8)+" ");   %></h1><%
            %><h1>出生日期：<% out.print(rs.getString(9)+" ");   %></h1><%
            %><h1>学生性别：<% out.print(rs.getString(10)+" ");   %></h1><%
            %><h1>学生电话：<% out.print(rs.getString(11)+" ");   %></h1><%
            %><h1>入学年份：<% out.print(rs.getString(12)+" ");   %></h1><%
        	}
        	String M_NUM=rs.getString(13);
        	String degree=rs.getString(5);
            String sql2="select department.D_NAME from student,department where S_NUM=\""+snum+"\" and student.min_D_NUM=department.D_NUM ;"; 
        	PreparedStatement ptmt2 = (PreparedStatement) conn.prepareStatement(sql2);
        	ResultSet rs2 = stmt.executeQuery(sql2);  
        	//rs2.next();
        	//rs2.last();
    		//int lastRow=rs2.getRow();
    		//if (lastRow==1) rs2.next();
            %><h1>辅修专业：<% if (rs2.next()==false){out.print("无");}else{ out.print(rs2.getString(1)+" ");}   %></h1><%
            
            String sql3="select sum(S_C_CREDIT) from score where S_NUM=\""+snum+"\";";
            PreparedStatement ptmt3 = (PreparedStatement) conn.prepareStatement(sql3);
        	ResultSet rs3 = stmt.executeQuery(sql3); 
        	rs3.next();
        	%><h1>已修学分：<% out.print(rs3.getString(1)+" ");   %></h1><%
        	
        	String sql4="select DOCTOR_CREDIT,POST_CREDIT,UNDER_CREDIT from major where M_NUM=\"" +M_NUM+ "\";";
        	PreparedStatement ptmt4 = (PreparedStatement) conn.prepareStatement(sql4);
        	ResultSet rs4 = stmt.executeQuery(sql4); 
        	rs4.next();
        	
        	String xuefen="";
        	if (degree.equals("博士")) {xuefen=rs4.getString(1);}
        	if (degree.equals("硕士")) {xuefen=rs4.getString(2);}
        	if (degree.equals("本科")) {xuefen=rs4.getString(3);}

        	 %><h1>应修学分：<% out.print(xuefen);   %></h1>  
        	 
        	 <h4>所修课程:</h4>
         	<table border="1"><%
         	%><tr><%
         		%><th><%
         			out.print("开课学期");          		
         		%></th><%
         		%><th><%
         			out.print("课程名称");       
         		%></th><%
         		%><th><%
     				out.print("授课教师");       
     			%></th><%
     			%><th><%
 					out.print("获得得分");       
 				%></th><%
 				%><th><%
					out.print("获得学分");       
				%></th><%
         	%></tr><%
         	 String sql22="select C_TERM,C_NAME,T_NAME,S_SCORE,S_C_CREDIT from score,course,teacher,open_course where teacher.T_NUM=score.T_NUM and course.C_NUM=score.C_NUM and open_course.C_NUM=score.C_NUM and S_NUM=\"" +snum+ "\";"; 
           //	out.print(sql22);
         	 PreparedStatement ptmt22 = (PreparedStatement) conn.prepareStatement(sql22);
    		//ptmt2.setString(1, tnum);
        	ResultSet rs22 = stmt.executeQuery(sql22);  
         	while(rs22.next()) {   
         	%><tr><%
         		%><th>
         		<%
         			out.print(rs22.getString(1)+" ");   
         			%>
         		</th><%
         		%><th>
         		<%
         			out.print(rs22.getString(2)+" ");   
         			%>
         		</th><%
         		%><th>
         		<%
         			out.print(rs22.getString(3)+" ");   
         			%>
         		</th><%
         		%><th>
         		<%
         			out.print(rs22.getString(4)+" ");   
         			%>
         		</th><%
         		%><th>
         		<%
         			out.print(rs22.getString(5)+" ");   
         			%>
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
%> 		<a style="margin-left:470px;" href="login_stu.html">查询其他学生</a>
	</body>
</html>