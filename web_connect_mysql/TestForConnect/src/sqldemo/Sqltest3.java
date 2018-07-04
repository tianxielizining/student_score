package sqldemo;
import java.sql.*;

public class Sqltest3
{
    public static void main(String[] args) throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");

        //一开始必须填一个已经存在的数据库
        String url = "jdbc:mysql://localhost:3306/hrm?useUnicode=true&characterEncoding=utf-8";   
        Connection conn = DriverManager.getConnection(url, "root", "123");
        Statement stat = conn.createStatement();//向数据库发送要执行的语句

        //创建数据库hello
        stat.executeUpdate("create database test");//运行给定的sql语句

        //打开创建的数据库
        stat.close();
        conn.close();
        url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
        conn = DriverManager.getConnection(url, "root", "123");
        stat = conn.createStatement();

        //创建表users
        stat.executeUpdate("create table users(username varchar(10) primary key , pass varchar(8))");
        //创建表person
        stat.executeUpdate("create table person(username varchar(10) ,foreign key (username) references users (username) , name varchar(20)primary key,age int(5) ,teleno char(11))");
        //创建外键约束
        // stat.executeUpdate("alter table person add constraint 'FK_person_users' foregin key('username') references users('username')");
        //向表users添加数据
        stat.executeUpdate("insert into users values('ly','123456')");
        stat.executeUpdate("insert into users values('liming','345678')");
        stat.executeUpdate("insert into users values('test', '11111')");
        stat.executeUpdate("insert into users values('test1', '12345')");
       //向表person添加数据
        stat.executeUpdate("insert into person values('ly','雷力',null,null)");
        stat.executeUpdate("insert into person values('liming','李明',25,null)");
        stat.executeUpdate("insert into person values('test','测试用户',20,'13388449933')");
        //查询table并输出
        ResultSet result = stat.executeQuery("select * from users");
        System.out.println("-----------------");
        System.out.println("执行结果如下所示:");  
        System.out.println("-----------------");  
        System.out.println("---table users---");
        System.out.println("姓名" + "\t" + "密码");  
        System.out.println("-----------------"); 
        while (result.next())
        {
            System.out.println(result.getString("username") + "\t" + result.getString("pass"));
        }
        System.out.println("-----------------"); 
        System.out.println("---table person---");
        System.out.println("username" + "\t" + "name"+"\t"+"age"+"\t"+"teleno");  
        System.out.println("-----------------"); 
        ResultSet result1 = stat.executeQuery("select * from person");
        while (result1.next())
        {
            System.out.println(result1.getString("username") + "\t\t" + result1.getString("name")+"\t" +result1.getString("age")+"\t" +result1.getString("teleno"));
        }
        //开始向person插入五行数据
        //stat.executeUpdate("insert into person values('(ly','王五',null,null)");
        //stat.executeUpdate("insert into person values('(test2','测试用户2',null,null)");
        //stat.executeUpdate("insert into person values('test1','测试用户1',33,null)");
        //stat.executeUpdate("insert into person values('(test','张三',23,'18877009966')");
        //stat.executeUpdate("insert into person values('(admin','admin',null,null)");
        //查询是否有我们想要插入的username，如果有就更新数据，没有就插入
        //stat.executeUpdate("update person set username='ly',name='王五' where username='ly' ");
       // stat.executeUpdate("update person set username='test2',name='测试用户2' where username='test2' ");
        //stat.executeUpdate("update person set username='test2',name='测试用户2' where username='test2' ");
        ResultSet result2 = stat.executeQuery("select * from person where username='ly' ");
        if(result2.next())
        	stat.executeUpdate("update person set name='王五' where username='ly' ");
        else{
			result2=stat.executeQuery("select * from users where username='ly'");
			if(result2.next()){    //next（）获取里面的内容
				stat.executeUpdate("insert into person values('ly', '王五',null,null)");
		    	}
			else{
				stat.executeUpdate("insert into users values('ly', '888888')");
				stat.executeUpdate("insert into person values('ly', '王五',null,null)");
			}	
	}	
    	result2=stat.executeQuery("select * from person where username='test2'");
		if(result2.next()){    //next（）获取里面的内容
			stat.executeUpdate("update person set name='测试用户2' where username='test2'");
		    }
		else{
			result2=stat.executeQuery("select * from users where username='test2'");
				if(result2.next()){    //next（）获取里面的内容
					stat.executeUpdate("insert into person values('test2', '测试用户2',null,null)");
			    	}
				else{
					stat.executeUpdate("insert into users values('test2', '888888')");
					stat.executeUpdate("insert into person values('test2', '测试用户2',null,null)");
					}
			}   
		
		
		result2=stat.executeQuery("select * from person where username='test1'");
		if(result2.next()){    //next（）获取里面的内容
			stat.executeUpdate("update person set name='测试用户1',age=33 where username='test1'");
		    }
		else{
			result2=stat.executeQuery("select * from users where username='test1'");
				if(result2.next()){    //next（）获取里面的内容
					stat.executeUpdate("insert into person values('test1','测试用户1',33,null)");
			    	}
				
				else{
					stat.executeUpdate("insert into users values('test1', '888888')");
					stat.executeUpdate("insert into person values('test1', '测试用户1',33,null)");
					}   
			}    
			
		result2=stat.executeQuery("select * from person where username='test'");
		if(result2.next()){    //next（）获取里面的内容
			stat.executeUpdate("update person set name='张三',age=23,teleno='18877009966' where username='test'");
		    }
		else{
			result2=stat.executeQuery("select * from users where username='test'");
				if(result2.next()){    //next（）获取里面的内容
					stat.executeUpdate("insert into person values('test','张三',23,'18877009966')");
			    	}
				
				else{
					stat.executeUpdate("insert into users values('test', '888888')");
					stat.executeUpdate("insert into person values('test', '张三',23,'18877009966')");
					}   
			}  
		
		result2=stat.executeQuery("select * from person where username='admin'");
		if(result2.next()){    //next（）获取里面的内容
			stat.executeUpdate("update person set name='admin' where username='admin'");
		    }
		else{
			result2=stat.executeQuery("select * from users where username='admin'");
				if(result2.next()){    //next（）获取里面的内容
					stat.executeUpdate("insert into person values('admin','admin',null,null)");
			    	}
				
				else{
					stat.executeUpdate("insert into users values('admin', '888888')");
					stat.executeUpdate("insert into person values('admin', 'admin',null,null)");
					}   
			}  
        /*
        else{
        	stat.executeUpdate("replace into users set username='ly',pass='888888' ");
          	stat.executeUpdate("replace into person set username='ly',name='王五',null,null");
        }*/
        //if(result3.getString("username") == "test2")
            //stat.executeUpdate("replace into person set username='test2',name='测试用户2',null,null");
        //else
           // stat.executeUpdate("insert into users values('test2',888888)");
            //stat.executeUpdate("insert into users values('ly','王五',null,null)");
        
        
        
        //打印更新之后的结果
        System.out.println("--------更新之后的结果---------"); 
        System.out.println("---table users---");
        System.out.println("姓名" + "\t" + "密码");  
        ResultSet result3 = stat.executeQuery("select * from users");
        while (result3.next())
        {
            System.out.println(result3.getString("username") + "\t" + result3.getString("pass"));
        }
        System.out.println("--------table  person----------");
        System.out.println("username" + "\t" + "name"+"\t\t"+"age"+"\t\t"+"teleno");  
        ResultSet result4 = stat.executeQuery("select * from person");
        while (result4.next())
        {
            System.out.println(result4.getString("username") + "\t\t" + result4.getString("name")+"\t" +result4.getString("age")+"\t\t" +result4.getString("teleno"));
        }
        //删除
        result=stat.executeQuery("select * from users where username like 'test%'");
        if(result.next()){
        	stat.executeUpdate("delete from person where username like 'test%' ");
        	stat.executeUpdate("delete from users where username like 'test%'");
        }
        //打印更新之后的结果
        System.out.println("--------删除之后的结果---------"); 
        System.out.println("---table users---");
        System.out.println("姓名" + "\t" + "密码");  
        ResultSet result8 = stat.executeQuery("select * from users");
        while (result8.next())
        {
            System.out.println(result8.getString("username") + "\t" + result8.getString("pass"));
        }
        System.out.println("--------table  person----------");
        System.out.println("username" + "\t" + "name"+"\t\t"+"age"+"\t\t"+"teleno");  
        ResultSet result9 = stat.executeQuery("select * from person");
        while (result9.next())
        {
            System.out.println(result9.getString("username") + "\t\t" + result9.getString("name")+"\t" +result9.getString("age")+"\t\t" +result9.getString("teleno"));
        }
        //关闭数据库
        result.close();
        stat.close();
        conn.close();
    }
}