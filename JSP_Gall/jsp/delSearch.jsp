<%@page import="java.net.InetAddress"%>
<%@page import="gall.SearchDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String ipAddress = request.getRemoteAddr();
	if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
	    InetAddress inetAddress = InetAddress.getLocalHost();
	    ipAddress = inetAddress.getHostAddress();
	}
	
	int result = 0;
	if(request.getParameter("del") == null)
		result = SearchDao.getInstance().delete(Integer.parseInt(request.getParameter("idx")));
	else
		result = SearchDao.getInstance().deleteAll(ipAddress);
	
	if(result != 0)
		response.sendRedirect("main.jsp");
%>