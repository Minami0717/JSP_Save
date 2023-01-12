<%@page import="mall.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	String m_id = session.getAttribute("id").toString();
	int result = OrderDao.getInstance().delete(id, m_id);
	if (result != 0)
		%><script>alert("주문이 취소되었습니다."); location.href="orderList.jsp";</script><%
%>