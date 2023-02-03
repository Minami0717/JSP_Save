<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if(request.getParameter("save").equals("on"))
		session.setAttribute("save", "on");
	else
		session.setAttribute("save", "off");
%>
<script>history.back()</script>