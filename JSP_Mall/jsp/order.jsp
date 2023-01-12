<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="mall.Order"%>
<%@page import="mall.OrderDao"%>
<%@page import="mall.CartDao"%>
<%@page import="mall.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String m_id = session.getAttribute("id").toString();
	List<Cart> list = CartDao.getInstance().selectAll(m_id);
	
	for (Cart c : list)	{
		Order order = new Order();
		order.setDate(LocalDateTime.now().format(
				DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		order.setProduct(c.getId() + " - " + c.getProduct());
		order.setPrice(c.getPrice());
		order.setCount(c.getCount());
		order.setMember_id(m_id);
		
		OrderDao.getInstance().insert(order);
	}
	
	int result = CartDao.getInstance().deleteAll(m_id);
	if (result != 0)
		response.sendRedirect("orderList.jsp");
%>