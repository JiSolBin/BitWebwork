package com.bit.emp.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.emp.model.EmpDao;
import com.bit.emp.model.EmpDto;

public class EmpController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EmpDto bean = new EmpDto();
		bean.setEmpno(Integer.parseInt(req.getParameter("empno")));
		
		EmpDao dao = new EmpDao();
		try {
			bean = dao.getOne(bean.getEmpno());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("bean", bean);
		req.getRequestDispatcher("emp/detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		try {
			EmpDto bean = new EmpDto();
			bean.setEmpno(Integer.parseInt(req.getParameter("empno")));
			bean.setEname(req.getParameter("ename"));
			bean.setSal(Integer.parseInt(req.getParameter("sal")));
			
			EmpDao dao = new EmpDao();
			dao.updateOne(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			// validation
			req.getRequestDispatcher("emp/detail.jsp").forward(req, resp);
			
			// java.lang.IllegalStateException: 응답이 이미 커밋된 후에는 forward할 수 없습니다.
			// catch해서 포워딩 후 다시 doGet 해서 그럼
			return;
		}
		
		// 리스트로 감
		// resp.sendRedirect("./emp.html");
		// detail 페이지로 감
		doGet(req, resp);
	}
}
