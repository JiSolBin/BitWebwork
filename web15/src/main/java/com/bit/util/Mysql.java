package com.bit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Mysql {
	
	private static Connection connection;
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/scott";
	private static final String user = "user01";
	private static final String password = "1234";
	
	private Mysql() {}
	
	public static Connection getConnection() throws SQLException {
		
		if(connection==null || connection.isClosed()) {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			connection = DriverManager.getConnection(url, user, password);
		}
		
		return connection;
	}
}
