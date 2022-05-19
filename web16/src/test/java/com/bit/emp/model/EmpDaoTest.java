package com.bit.emp.model;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.bit.util.Mysql;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EmpDaoTest {
	
	Logger logger = Logger.getLogger(EmpDaoTest.class);
	static EmpDto target;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		target = new EmpDto();
		target.setEmpno(9999);	
		target.setEname("test9999");
		target.setSal(10000);	
	}

	@Test
	public void test1GetList() throws SQLException {

		EmpDao dao = new EmpDao();
		assertNotNull(dao.getList());
		assertTrue(dao.getList().size()>0);
		
		for(EmpDto bean : dao.getList())
			logger.debug(bean);
	}
	
	@Test
	public void test4GetOne() throws SQLException {
		
		EmpDao dao = new EmpDao();
		assertNotNull(dao.getOne(target.getEmpno()));
		assertEquals(target.getEname(), dao.getOne(target.getEmpno()).getEname());
		assertTrue(target.getSal() == dao.getOne(target.getEmpno()).getSal());
	}

	@Test
	public void test2InsertOne() throws SQLException {

		EmpDao dao = new EmpDao();
		assertTrue(dao.insertOne(target));
	}

	@Test
	public void test3UpdateOne() throws SQLException {

		target.setEname("test8888");
		target.setSal(8000);
		
		EmpDao dao = new EmpDao();
		assertTrue(dao.updateOne(target)>0);
	}

	@Test
	public void test5DeleteOne() throws SQLException {

		EmpDao dao = new EmpDao();
		assertTrue(dao.deleteOne(target.getEmpno())>0);
	}
	
}
