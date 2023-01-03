<%@page import="mall.ProductDao"%>
<%@page import="mall.Product"%>
<%@page import="mall.Cart"%>
<%@page import="mall.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	Product product = ProductDao.getInstance().selectOne(id);
	Cart cart = new Cart();
	cart.setId(product.getId());
	cart.setProduct(product.getName());
	cart.setPrice(product.getPrice());
	cart.setCount(1);
	
	int result = CartDao.getInstance().insert(cart);
	if (result != 0) {
		%><script>alert("장바구니에 상품을 담았습니다."); history.back()</script><%
	}
	else {
		result = CartDao.getInstance().update(id);
		if (result != 0) {
			%><script>alert("장바구니에 상품을 담았습니다."); history.back()</script><%
		}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>