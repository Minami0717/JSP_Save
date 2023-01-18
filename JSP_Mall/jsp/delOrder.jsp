<%@page import="mall.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int result = OrderDao.getInstance().delete(idx);
	if (result != 0)
		%><script>alert("주문이 취소되었습니다."); location.href="orderList.jsp";</script><%
%>