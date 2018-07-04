
<%@ page   pageEncoding="utf-8"%>  
<%request.setCharacterEncoding("utf-8");%>  

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>

<%request.setCharacterEncoding("utf-8");%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>major_change_modify</title>
<style type="text/css">

body{
  font-weight:200;
  scroll=no;
    font-size:12px;
}
table{
    margin: 100px auto;
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
<script type="text/javascript">
 $(document).ready(function(){
   $("#focus .input_txt").each(function(){
     var thisVal=$(this).val();
     //判断文本框的值是否为空，有值的情况就隐藏提示语，没有值就显示
     if(thisVal!=""){
       $(this).siblings("span").hide();
      }else{
       $(this).siblings("span").show();
      }
     //聚焦型输入框验证 
     $(this).focus(function(){
       $(this).siblings("span").hide();
      }).blur(function(){
        var val=$(this).val();
        if(val!=""){
         $(this).siblings("span").hide();
        }else{
         $(this).siblings("span").show();
        } 
      });
    })
    $("#keydown .input_txt").each(function(){
     var thisVal=$(this).val();
     //判断文本框的值是否为空，有值的情况就隐藏提示语，没有值就显示
     if(thisVal!=""){
       $(this).siblings("span").hide();
      }else{
       $(this).siblings("span").show();
      }
      $(this).keyup(function(){
       var val=$(this).val();
       $(this).siblings("span").hide();
      }).blur(function(){
        var val=$(this).val();
        if(val!=""){
         $(this).siblings("span").hide();
        }else{
         $(this).siblings("span").show();
        }
       })
     }) 
  })
</script>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
	String Url="jdbc:mysql://localhost:3306/student_score?user=root&password=031088&useUnicode=true&characterEncoding=utf-8";
	Connection conn=DriverManager.getConnection(Url);
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
	Statement stmt = conn.createStatement();
	//String majornum=request.getParameter("majornum");
	String departmentnum=request.getParameter("departmentnum");
	String dphone=request.getParameter("departmentphone");
	
	String sql1="SELECT D_NAME,D_ADDR from department where D_NUM= \""+departmentnum+"\";";
	PreparedStatement ptmt = (PreparedStatement) conn.prepareStatement(sql1);
	ptmt.execute();
	ResultSet rs = stmt.executeQuery(sql1); 
	rs.next();
  	String dname=rs.getString(1);
  	String daddr=rs.getString(2);
	//String mcount=request.getParameter("mcount");	
	//String tcount=request.getParameter("tcount");	
	
    	conn.close();
	%> 	

    <form action= "department_change_modify_2.jsp" method="post" onsubmit="return check();">
        <table align="center" width="450">
            <tr>
                <td align="center" colspan="2">
                    <h2>修改院系信息</h2>
                    <hr>
                </td>
            </tr>
            <tr>
                <td align="right">院系编号：</td>
                <td><input type="text" id="a1" name="D_NUM" value="<%=departmentnum%>" readonly="true" ></input></td>
            </tr>
            <tr>
                <td align="right">院系名称：</td>
                <td><input type="text" id="a2" name="D_NAME" value="<%=dname%>" ></input></td>
            </tr>
            <tr>
                <td align="right">院系地址：</td>
                <td><input type="text" id="a3" name="D_ADDR" value="<%=daddr%>" ></input></td>
            </tr>
            <tr>
                <td align="right">办公电话：</td>
                <td><input type="text" id="a4" name="D_PHONE" value="<%=dphone%>"  ></input></td>
            </tr>
           
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" value="修改">
                </td>
            </tr>
        </table>
        </form>
<script type="text/javascript">
function check(){
	var b1 = document.getElementById("a1").value; 
	var b2 = document.getElementById("a2").value; 
	//var b3 = document.getElementById("a3").value;
	if(b1 ==''|| b1== null){
		alert("院系编号不能为空，请修改后提交！");
		return false;
	}
	else if(b2 ==''|| b2== null){
		alert("院系名称不能为空，请修改后提交！");
		return false;
	}
	else{
		return true;		
	}
}
</script>
        
       <% 
        }
	catch(Exception e)
	{
    	out.print("信息加载失败！！！");
    	e.printStackTrace();
	}%>
</body>
</html>