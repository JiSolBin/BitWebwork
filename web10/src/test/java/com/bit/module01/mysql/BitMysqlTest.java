package com.bit.module01.mysql;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

public class BitMysqlTest {

	@Test
	public void testGetConnection() throws ClassNotFoundException, SQLException {
        Connection conn = BitMysql.getConnection();
        
//      assertNotNull(conn);
        
		try {
			// 이런 것은 내가 직접 처리, 모듈상의 exception은 throw 해줬음
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
