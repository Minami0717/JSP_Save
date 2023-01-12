<%@page import="mall.CartDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	String m_id = session.getAttribute("id").toString();
	int result = CartDao.getInstance().delete(id, m_id);
	if (result != 0)
		response.sendRedirect("cartForm.jsp");
%>