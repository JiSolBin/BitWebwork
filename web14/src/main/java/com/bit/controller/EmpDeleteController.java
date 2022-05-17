package com.bit.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.util.BitMy;
import com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute;

public class EmpDeleteController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int empno = Integer.parseInt(req.getParameter("empno"));
		String sql = "delete from emp where empno="+empno;
		
		try(
				Connection connection = BitMy.getConnection();
				Statement statement = connection.createStatement();
		){
			statement.executeUpdate(sql);
			resp.setStatus(HttpServletResponse.SC_OK);
		} catch (SQLException e) {
			e.printStackTrace();
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}
}
