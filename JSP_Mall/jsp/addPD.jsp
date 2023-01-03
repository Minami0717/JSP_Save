<%@page import="mall.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="mall.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String des = request.getParameter("des");
	String maker = request.getParameter("maker");
	String category = request.getParameter("category");
	String condition = request.getParameter("condition");
	String image = request.getParameter("image");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	
	Product product = new Product();
	product.setId(id);
	product.setName(name);
	product.setDescription(des);
	product.setMaker(maker);
	product.setCategory(category);
	product.setCondition(condition);
	product.setImage(image);
	product.setPrice(price);
	product.setStock(stock);
	
	int result = ProductDao.getInstance().insert(product);
	if (result != 0)
		response.sendRedirect("products.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>