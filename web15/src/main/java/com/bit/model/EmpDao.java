package com.bit.model;

import java.util.List;

import org.apache.log4j.Logger;

import com.bit.util.Mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EmpDao {

	Logger log = Logger.getLogger(this.getClass());
	
	public List<EmpDto> getList(){
		
		List<EmpDto> list = new ArrayList<>();
		String sql = "select * from emp order by empno desc";
		try (
				Connection connection = Mysql.getConnection();
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(sql);
		){
			while(rs.next()) {
				EmpDto bean = new EmpDto();
				bean.setEmpno(rs.getInt("empno"));
				bean.setEname(rs.getString("ename"));
				bean.setSal(rs.getInt("sal"));
				bean.setHiredate(rs.getTimestamp("hiredate"));
				list.add(bean);
				log.debug(bean.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
