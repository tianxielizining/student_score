package sqldemo;
import java.sql.*;

public class Sqltest3
{
    public static void main(String[] args) throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");

        //һ��ʼ������һ���Ѿ����ڵ����ݿ�
        String url = "jdbc:mysql://localhost:3306/hrm?useUnicode=true&characterEncoding=utf-8";   
        Connection conn = DriverManager.getConnection(url, "root", "123");
        Statement stat = conn.createStatement();//�����ݿⷢ��Ҫִ�е����

        //�������ݿ�hello
        stat.executeUpdate("create database test");//���и�����sql���

        //�򿪴��������ݿ�
        stat.close();
        conn.close();
        url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
        conn = DriverManager.getConnection(url, "root", "123");
        stat = conn.createStatement();

        //������users
        stat.executeUpdate("create table users(username varchar(10) primary key , pass varchar(8))");
        //������person
        stat.executeUpdate("create table person(username varchar(10) ,foreign key (username) references users (username) , name varchar(20)primary key,age int(5) ,teleno char(11))");
        //�������Լ��
        // stat.executeUpdate("alter table person add constraint 'FK_person_users' foregin key('username') references users('username')");
        //���users�������
        stat.executeUpdate("insert into users values('ly','123456')");
        stat.executeUpdate("insert into users values('liming','345678')");
        stat.executeUpdate("insert into users values('test', '11111')");
        stat.executeUpdate("insert into users values('test1', '12345')");
       //���person�������
        stat.executeUpdate("insert into person values('ly','����',null,null)");
        stat.executeUpdate("insert into person values('liming','����',25,null)");
        stat.executeUpdate("insert into person values('test','�����û�',20,'13388449933')");
        //��ѯtable�����
        ResultSet result = stat.executeQuery("select * from users");
        System.out.println("-----------------");
        System.out.println("ִ�н��������ʾ:");  
        System.out.println("-----------------");  
        System.out.println("---table users---");
        System.out.println("����" + "\t" + "����");  
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
        //��ʼ��person������������
        //stat.executeUpdate("insert into person values('(ly','����',null,null)");
        //stat.executeUpdate("insert into person values('(test2','�����û�2',null,null)");
        //stat.executeUpdate("insert into person values('test1','�����û�1',33,null)");
        //stat.executeUpdate("insert into person values('(test','����',23,'18877009966')");
        //stat.executeUpdate("insert into person values('(admin','admin',null,null)");
        //��ѯ�Ƿ���������Ҫ�����username������о͸������ݣ�û�оͲ���
        //stat.executeUpdate("update person set username='ly',name='����' where username='ly' ");
       // stat.executeUpdate("update person set username='test2',name='�����û�2' where username='test2' ");
        //stat.executeUpdate("update person set username='test2',name='�����û�2' where username='test2' ");
        ResultSet result2 = stat.executeQuery("select * from person where username='ly' ");
        if(result2.next())
        	stat.executeUpdate("update person set name='����' where username='ly' ");
        else{
			result2=stat.executeQuery("select * from users where username='ly'");
			if(result2.next()){    //next������ȡ���������
				stat.executeUpdate("insert into person values('ly', '����',null,null)");
		    	}
			else{
				stat.executeUpdate("insert into users values('ly', '888888')");
				stat.executeUpdate("insert into person values('ly', '����',null,null)");
			}	
	}	
    	result2=stat.executeQuery("select * from person where username='test2'");
		if(result2.next()){    //next������ȡ���������
			stat.executeUpdate("update person set name='�����û�2' where username='test2'");
		    }
		else{
			result2=stat.executeQuery("select * from users where username='test2'");
				if(result2.next()){    //next������ȡ���������
					stat.executeUpdate("insert into person values('test2', '�����û�2',null,null)");
			    	}
				else{
					stat.executeUpdate("insert into users values('test2', '888888')");
					stat.executeUpdate("insert into person values('test2', '�����û�2',null,null)");
					}
			}   
		
		
		result2=stat.executeQuery("select * from person where username='test1'");
		if(result2.next()){    //next������ȡ���������
			stat.executeUpdate("update person set name='�����û�1',age=33 where username='test1'");
		    }
		else{
			result2=stat.executeQuery("select * from users where username='test1'");
				if(result2.next()){    //next������ȡ���������
					stat.executeUpdate("insert into person values('test1','�����û�1',33,null)");
			    	}
				
				else{
					stat.executeUpdate("insert into users values('test1', '888888')");
					stat.executeUpdate("insert into person values('test1', '�����û�1',33,null)");
					}   
			}    
			
		result2=stat.executeQuery("select * from person where username='test'");
		if(result2.next()){    //next������ȡ���������
			stat.executeUpdate("update person set name='����',age=23,teleno='18877009966' where username='test'");
		    }
		else{
			result2=stat.executeQuery("select * from users where username='test'");
				if(result2.next()){    //next������ȡ���������
					stat.executeUpdate("insert into person values('test','����',23,'18877009966')");
			    	}
				
				else{
					stat.executeUpdate("insert into users values('test', '888888')");
					stat.executeUpdate("insert into person values('test', '����',23,'18877009966')");
					}   
			}  
		
		result2=stat.executeQuery("select * from person where username='admin'");
		if(result2.next()){    //next������ȡ���������
			stat.executeUpdate("update person set name='admin' where username='admin'");
		    }
		else{
			result2=stat.executeQuery("select * from users where username='admin'");
				if(result2.next()){    //next������ȡ���������
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
          	stat.executeUpdate("replace into person set username='ly',name='����',null,null");
        }*/
        //if(result3.getString("username") == "test2")
            //stat.executeUpdate("replace into person set username='test2',name='�����û�2',null,null");
        //else
           // stat.executeUpdate("insert into users values('test2',888888)");
            //stat.executeUpdate("insert into users values('ly','����',null,null)");
        
        
        
        //��ӡ����֮��Ľ��
        System.out.println("--------����֮��Ľ��---------"); 
        System.out.println("---table users---");
        System.out.println("����" + "\t" + "����");  
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
        //ɾ��
        result=stat.executeQuery("select * from users where username like 'test%'");
        if(result.next()){
        	stat.executeUpdate("delete from person where username like 'test%' ");
        	stat.executeUpdate("delete from users where username like 'test%'");
        }
        //��ӡ����֮��Ľ��
        System.out.println("--------ɾ��֮��Ľ��---------"); 
        System.out.println("---table users---");
        System.out.println("����" + "\t" + "����");  
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
        //�ر����ݿ�
        result.close();
        stat.close();
        conn.close();
    }
}