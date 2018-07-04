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
    		
        	String Snum = request.getParameter("Snum");  
        	String Dnum = request.getParameter("Dnum");
        	String Mnum = request.getParameter("Mnum");
        	
        	String Sname= request.getParameter("Sname");  
        	String Sdegree= request.getParameter("Sdegree");
        	String Sidnumber= request.getParameter("Sidnumber");
        	
        	String Sschooladdr= request.getParameter("Sschooladdr");  
        	String Shomeaddr= request.getParameter("Shomeaddr");
        	String Sdaybirth= request.getParameter("Sdaybirth");
        	
        	
        	String Ssex= request.getParameter("Ssex");  
        	String Sphone= request.getParameter("Sphone");
        	String Senteryear= request.getParameter("Senteryear");
        	String Min_major= request.getParameter("min_major");
        	
        	
        	String sql1="select * from student where S_NUM=\""+Snum+"\";"; 
        	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
        	ResultSet rs = stmt.executeQuery(sql1);  
        	boolean HasNextData=rs.next();
        	if (HasNextData==true) {out.print("<script>alert('该学号已存在！');window.location.href='student_insert.jsp'</script>");}
        	else{
        	
       		
            String sql12="insert into student( S_NUM, D_NUM,M_NUM,S_NAME,S_DEGREE,S_IDCARD,S_ROOM,S_HOME_ADDR,S_BIRTH,S_SEX,S_PHONE,S_ENTER_YEAR,MIN_D_NUM ) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps12=conn.prepareStatement(sql12);
            ps12.setString(1,Snum);
            ps12.setString(2,Dnum);
            ps12.setString(3,Mnum);
            
            ps12.setString(4,Sname);
            ps12.setString(5,Sdegree);
            ps12.setString(6,Sidnumber);
            
            ps12.setString(7,Sschooladdr);
            ps12.setString(8,Shomeaddr);
            ps12.setString(9,Sdaybirth);
            
            ps12.setString(10,Ssex);
            ps12.setString(11,Sphone);
            ps12.setString(12,Senteryear);
            ps12.setString(13,Min_major);
           	ps12.execute();
        	ps12.close();
			%>
        	<h4>增加成功</h4>
        	<a href="search_all_stu.jsp">查看增加结果</a>
   
        	<%
        	conn.close();
        	}
    	}
		catch(Exception e)
		{
        	out.print("失败");
        	e.printStackTrace();
    	}
%> 
	</body>
</html>