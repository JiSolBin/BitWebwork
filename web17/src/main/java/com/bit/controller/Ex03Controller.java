package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex03.html")
public class Ex03Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String key1 = getInitParameter("key1");
		String key2 = getInitParameter("key2");
		System.out.println("ex03 controller...");
		System.out.println("key1:"+key1+", key2:"+key2);
	}
}
