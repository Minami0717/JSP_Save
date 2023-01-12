<%@page import="mall.ProductDao"%>
<%@page import="mall.Product"%>
<%@page import="mall.Cart"%>
<%@page import="mall.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("id") == null) {
		%><script>alert("로그인이 필요합니다."); history.back()</script><%
		return;
	}

	String id = request.getParameter("id");
	String m_id = session.getAttribute("id").toString();
	Product product = ProductDao.getInstance().selectOne(id);
	
	Cart cart = new Cart();
	cart.setId(product.getId());
	cart.setProduct(product.getName());
	cart.setPrice(product.getPrice());
	cart.setCount(1);
	cart.setMember_id(m_id);
	
	if (CartDao.getInstance().isSame(id, m_id)) {
		int result = CartDao.getInstance().update(id, m_id);
		if (result != 0) {
			%><script>alert("장바구니에 상품을 담았습니다."); history.back()</script><%
		}
	}
	else {
		int result = CartDao.getInstance().insert(cart);
		if (result != 0) {
		%><script>alert("장바구니에 상품을 담았습니다."); history.back()</script><%
		}
	}
%>