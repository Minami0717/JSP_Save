<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.invalidate();
	
	if (request.getParameter("where").equals("main"))
		response.sendRedirect("main.jsp");
	else if (request.getParameter("where").equals("gall")) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		response.sendRedirect("gallMain.jsp?idx="+idx);
	}
%>