package com.bit.emp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.emp.model.EmpDto;
import com.bit.util.Mysql;

public class EmpDao {
	
	private PreparedStatement pstmt;
	private ResultSet rs;

	public List<EmpDto> getList() throws SQLException {
		
		List<EmpDto> list = new ArrayList<>();
		String sql = "select * from emp order by empno desc";
		
		try{
			pstmt = Mysql.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmpDto dto = new EmpDto();
				dto.setDeptno(rs.getInt("deptno"));
				dto.setEmpno(rs.getInt("empno"));
				dto.setEname(rs.getString("ename"));
				dto.setJob(rs.getString("job"));
				dto.setSal(rs.getInt("sal"));
				dto.setHiredate(rs.getDate("hiredate"));
				list.add(dto);
			}
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(Mysql.getConnection()!=null) Mysql.getConnection().close();
		}
		
		return list;
	}
	
	public void getOne() {}
	public void insertOne() {}
	public void updateOne() {}
	public void deleteOne() {}
}
