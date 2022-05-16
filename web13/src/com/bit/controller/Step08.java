package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Step08 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		String id = new String(req.getParameter("id").getBytes("8859_1"), "UTF-8");

		PrintWriter pw = resp.getWriter();
		pw.println("<html><head><meta charset=\"utf8\"></head><body>");
		pw.println("Get ex08 page");
		pw.println("<p>id : " + id + "</p>");
		pw.println("</body></html>");
		pw.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// [pageContext]
		// request(o)
		// response(o)
		// session -> req.getSession()
		// application -> req.getServletContext() 또는 getServletConfig() 이용

		// System.out.println(req.getContextPath());
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		String id = req.getParameter("id");

		PrintWriter pw = resp.getWriter();
		pw.println("<html><head><meta charset=\"utf8\"></head><body>");
		pw.println("Post ex08 page");
		pw.println("<p>id : " + id + "</p>");
		pw.println("</body></html>");
		pw.close();
	}
}
