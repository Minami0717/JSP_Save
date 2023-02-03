<%@page import="gall.Search"%>
<%@page import="java.net.InetAddress"%>
<%@page import="gall.SearchDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if(request.getParameter("save").equals("on")) {
		String ipAddress = request.getRemoteAddr();
		if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
		    InetAddress inetAddress = InetAddress.getLocalHost();
		    ipAddress = inetAddress.getHostAddress();
		}
		
		Search search = new Search();
		search.setWord(request.getParameter("word"));
		search.setIp(ipAddress);
		
		SearchDao.getInstance().wordCheck(search);
		SearchDao.getInstance().insert(search);
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
</body>
</html>