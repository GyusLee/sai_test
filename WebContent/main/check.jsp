<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String img=request.getParameter("img");
	String content=request.getParameter("content");
	
	out.print(img);
	out.print(content);
	
	
%>