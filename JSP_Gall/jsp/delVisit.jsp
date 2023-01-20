<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	ArrayList<String> vList = (ArrayList)session.getAttribute("visitList");
	vList.remove(request.getParameter("gall"));
	response.sendRedirect(request.getParameter("url"));
%>