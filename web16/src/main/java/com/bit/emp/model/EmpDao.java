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
	
//	private boolean test;
//	
//	public void setTest(boolean test) {
//		this.test = test;
//	}
	
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
	
	public EmpDto getOne(int num) throws SQLException {
		
		EmpDto bean = null;
		String sql = "select * from emp where empno=?";
		
		try {
			pstmt = Mysql.getConnection().prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean=new EmpDto();
				bean.setDeptno(rs.getInt("deptno"));
				bean.setEmpno(rs.getInt("empno"));
				bean.setEname(rs.getString("ename"));
				bean.setHiredate(rs.getDate("hiredate"));
				bean.setJob(rs.getString("job"));
				bean.setSal(rs.getInt("sal"));
			}
		}finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(Mysql.getConnection()!=null) Mysql.getConnection().close();
		}
		
		return bean;
	}
	
	public boolean insertOne(EmpDto bean) throws SQLException {
		
		String sql = "insert into emp (empno, ename, sal, hiredate) values (?,?,?,now())";
		try {
			pstmt = Mysql.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bean.getEmpno());
			pstmt.setString(2, bean.getEname());
			pstmt.setInt(3, bean.getSal());
			return pstmt.executeUpdate()>0;
		} finally {
			// 계속 insert test 가능하도록 추가한 코드 (mySQL은 필요 없음)
			// 다른 DB일 경우 setAutoCommit(false) 해줘도 commit 하므로
			// 이런식으로 변수 사용하여 rollback 시켜줘야 함
			// if(test) Mysql.getConnection().rollback();
			// else Mysql.getConnection().commit();
			
			if(pstmt!=null) pstmt.close();
			if(Mysql.getConnection()!=null) Mysql.getConnection().close();
		}
	}
	
	public int updateOne(EmpDto bean) throws SQLException {
		
		String sql = "update emp set ename=?, sal=?, hiredate=now() where empno=?";
		try {
			pstmt = Mysql.getConnection().prepareStatement(sql);
			pstmt.setString(1, bean.getEname());
			pstmt.setInt(2, bean.getSal());
			pstmt.setInt(3, bean.getEmpno());
			return pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(Mysql.getConnection()!=null) Mysql.getConnection().close();
		}
	}
	
	public int deleteOne(int num) throws SQLException {
		
		String sql = "delete from emp where empno=?";
		try {
			pstmt = Mysql.getConnection().prepareStatement(sql);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(Mysql.getConnection()!=null) Mysql.getConnection().close();
		}
	}
}
