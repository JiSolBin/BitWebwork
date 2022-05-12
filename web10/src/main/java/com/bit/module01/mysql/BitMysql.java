package com.bit.module01.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// 디자인패턴 - 싱글톤 패턴
public class BitMysql {
	
	private static Connection conn = null;
	
	// 디폴트 생성자를 private -> 다른 곳에서 객체 생성 불가능 + static = 싱글톤
	// 메서드만 사용하도록 (객체 생성 필요없는 static 메서드)
	private BitMysql(){}
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/scott";
		String user = "user01";
		String password = "1234";
		
		// 여기서 try catch 하고 pom.xml에서 mysql 관련 dependency 지우면
		// exception을 catch 하므로 test는 성공하지만, 정상적으로 작동X 
//		try {
			if(conn==null || conn.isClosed()) {
				//Connection conn = null;
				
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
			}
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
		return conn;
	}
}
