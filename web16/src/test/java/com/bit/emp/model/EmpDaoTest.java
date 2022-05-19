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
	
	@Test
	public void testGetOne() throws SQLException {
		
		EmpDao dao = new EmpDao();
		assertNull(dao.getOne(99999));
		assertNotNull(dao.getOne(1112));
		assertEquals("test", dao.getOne(1112).getEname());
		assertTrue(500 == dao.getOne(1112).getSal());
	}

	@Test
	public void testInsertOne() throws SQLException {

		EmpDto target = new EmpDto();
		target.setEmpno(8888);
		target.setEname("test");
		target.setSal(500);
		
		Mysql.getConnection().setAutoCommit(false);
		EmpDao dao = new EmpDao();
		assertTrue(dao.insertOne(target));
	}

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
