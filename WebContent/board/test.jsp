<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String content=request.getParameter("content");
	String nickName=request.getParameter("nickName");
	
	out.print(content);
	out.print(nickName);
%>