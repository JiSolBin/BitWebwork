package com.bit.model;

import java.util.List;

import org.apache.log4j.Logger;

import com.bit.util.Mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

	public void insertOne(int empno, String ename, int sal) {
		
		String sql = "insert into emp (empno, ename, sal, hiredate) values (?,?,?,now())";
		try(
				Connection connection = Mysql.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql);
		){
			// 치환할 것을 던져줌
			pstmt.setInt(1, empno);
			pstmt.setString(2, ename);
			pstmt.setInt(3, sal);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public EmpDto getOne(int empno) {

		String sql = "select * from emp where empno=?";
		try(
				Connection connection = Mysql.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql); 
		){
			// 치환할 것을 던져줌
			pstmt.setInt(1, empno);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				EmpDto bean = new EmpDto();
				bean.setEmpno(rs.getInt("empno"));
				bean.setEname(rs.getString("ename"));
				bean.setHiredate(rs.getTimestamp("hiredate"));
				bean.setSal(rs.getInt("sal"));
				bean.setJob(rs.getString("job"));
				rs.close();
				return bean;
			}
		} catch (SQLException e) {
			StackTraceElement[] errs = e.getStackTrace();
			for(StackTraceElement ele:errs)
				log.error(ele.getLineNumber()+"줄 - "+ele.getClassName()+"-"+ele.getMethodName());
		}
		
		return null;
	}
}
