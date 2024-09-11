package vn.iotstar.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	 public static Connection getConn()
	 {
		 try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ltweb01?useSSL=false&useUnicode=true&characterEncoding=UTF-8","root","Vtth2004@");
			return conn;
		 } catch(Exception e) {
			 System.out.println(e);
			 return null;
		 }
	 }
}
