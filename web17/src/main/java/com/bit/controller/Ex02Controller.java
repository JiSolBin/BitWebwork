package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// web.xml에서 ex02엔 파라미터를 넘겨주지 않았기 때문에 null
		String param1 = getInitParameter("param1");
		String param2 = getInitParameter("param2");
		System.out.println("web xml mapping servlet... Ex02 param1 : " + param1);
		System.out.println("web xml mapping servlet... Ex02 param2 : " + param2);
		
		// context param이라서 어디서든 받을 수 있음
		System.out.println("--------context---------");
		String cparam1 = req.getServletContext().getInitParameter("cname1");
		System.out.println("Ex01 context param:"+cparam1);
	}
}
