package com.bit.module01.mysql;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.junit.Test;

public class BitEmpTest {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Test
	public void testGetList() throws ClassNotFoundException, SQLException {
		BitEmp emp = new BitEmp();
		ArrayList<EmpBean> list = (ArrayList<EmpBean>)emp.getList();
		
		// 개선된 loop (1.7~), 제네릭 필수
		// 배열, HashSet<EmpBean> 등 다 가능
		for(EmpBean bean : list)
			log.debug(bean);
		
		// 다양한 상황에 대한 체크를 해봐야 함
		assertNotNull(list);
		assertTrue(list.size()>0);
	}

}
