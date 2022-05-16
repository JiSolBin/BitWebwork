package com.bit.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Step01 implements Servlet{
   ServletConfig config;

   @Override
   public void destroy() {
	   // 서버 종료 포트(?)로 신호를 보내면 destroy
	   // 당연히 그냥 톰캣 stop 해도 destroy 됨
	   // 중지신호 -> destroy() -> 중지
      System.out.println("서블릿 객체 소멸");
   }
   
   @Override
   public void init(ServletConfig arg0) throws ServletException {
      System.out.println("서블릿 객체 생성");
      config = arg0;
   }

   @Override
   public ServletConfig getServletConfig() {
	   // service에서 필요 할 때 볼 수 있도록 getter 생성
      System.out.println("getServletConfig");
      return null;
   }

   @Override
   public String getServletInfo() {
	   // 페이지 디렉티브 (<%@ %>)의 info와 같은 역할
      System.out.println("getServletInfo");
      return "servlet info";
   }

   @Override
   public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
	   // 자바 main과 같은 역할
      System.out.println("service");
      
      OutputStream os = res.getOutputStream();
      PrintStream out = new PrintStream(os);
      out.println("<h1>hello world</h1>");
      out.close();
      os.close();
   }
   
}