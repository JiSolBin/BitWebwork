package com.bit.emp.model;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.junit.Test;

import com.bit.util.Mysql;

public class EmpDaoTest {
	
	Logger logger = Logger.getLogger(EmpDaoTest.class);

	@Test
	public void testGetList() throws SQLException {

		EmpDao dao = new EmpDao();
		assertNotNull(dao.getList());
		assertTrue(dao.getList().size()>0);
		
		for(EmpDto bean : dao.getList())
			logger.debug(bean);
	}
	
//	@Test
//	public void testGetOne() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testInsertOne() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testUpdateOne() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testDeleteOne() {
//		fail("Not yet implemented");
//	}
	
}
