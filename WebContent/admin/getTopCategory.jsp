<%@page import="com.sai.model.domain.TopCate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	List<TopCate> topCateList = (List)request.getAttribute("topCateList");
	out.println(topCateList.size());
%>
