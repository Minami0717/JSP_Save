<%@page import="mall.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int result = CartDao.getInstance().deleteAll(session.getAttribute("id").toString());
	if (result != 0)
		response.sendRedirect("cartForm.jsp");
%>