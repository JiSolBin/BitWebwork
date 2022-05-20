package com.bit.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex01Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// getInitParameter 앞에 'this.' 이 생략됨
		String param1 = getInitParameter("param1");
		String param2 = getInitParameter("param2");
		System.out.println("web xml mapping servlet... Ex01 param1 : " + param1);
		System.out.println("web xml mapping servlet... Ex01 param2 : " + param2);
		
		// 파라미터 이름을 모를 때
		Enumeration<String> names = getInitParameterNames();
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			System.out.println(name + ":" + getInitParameter(name));
		}
		
		// context param이라서 어디서든 받을 수 있음
		System.out.println("--------context---------");
		String cparam1 = req.getServletContext().getInitParameter("cname1");
		System.out.println("Ex01 context param:"+cparam1);
		
		// 결국 config에서 파라미터를 가져오는 것!!
		String param3 = getServletConfig().getInitParameter("param1");
		System.out.println(param3);
		
		// ?
		String viewName = getServletConfig().getInitParameter("viewName");
		req.getRequestDispatcher(viewName + ".jsp").forward(req, resp);
	}
}
