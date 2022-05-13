package com.bit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class DBServer {
	private static Connection conn;
	private static String driver = "com.mysql.cj.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/scott";
	private static String user = "user01";
	private static String password = "1234";
	// static이라 this가 안되므로 문자열로 class 정보 줌
	private static Logger log = Logger.getLogger("com.bit.util.DBServer");
	
	private DBServer() {}
	
	// 서버에 배포되었을 경우 url이 달라질 수 있으므로 생성
	public static void setUrl(String url) {
		DBServer.url = url;
	}
	
	public static Connection getConnection() throws SQLException {
		
		if(conn==null || conn.isClosed()) {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				log.error("드라이버 라이브러리 확인할 것");
			}
			
			conn = DriverManager.getConnection(url, user, password);
		}
		
		return conn;
	}
}