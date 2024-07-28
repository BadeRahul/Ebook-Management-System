package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconnection {
	
	private static Connection con;
	
	private static String Driver="com.mysql.cj.jdbc.Driver";
	
	private static String URL="jdbc:mysql://localhost:3306/ebook-app";
	
	private static String Username="root";
	
	private static String Password="Rahul@08";
	
	public static Connection getConn() {
		
		try {
			
			Class.forName(Driver);
			
			con = DriverManager.getConnection(URL, Username, Password);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
