<%@page import="gall.PostDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String reco = request.getParameter("reco");
	int result = 0;
	
	if (reco.equals("re"))
		result = PostDao.getInstance().updateReco(p_idx);
	else if (reco.equals("de"))
		result = PostDao.getInstance().updateDeco(p_idx);
	
	if (result != 0)
		response.sendRedirect("result.jsp?idx="+idx+"&p_idx="+p_idx);
%>