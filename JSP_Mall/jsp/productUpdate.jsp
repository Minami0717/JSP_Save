<%@page import="mall.ProductDao"%>
<%@page import="mall.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String des = request.getParameter("des");
	String id = request.getParameter("id");
	String maker = request.getParameter("maker");
	String category = request.getParameter("category");
	String con = request.getParameter("con");
	
	if(name.isEmpty()) {
		%><script>alert("상품 이름을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(des.isEmpty()) {
		%><script>alert("상품 설명을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(maker.isEmpty()) {
		%><script>alert("제조사를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(category.isEmpty()) {
		%><script>alert("상품 분류를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(request.getParameter("stock").isEmpty()) {
		%><script>alert("재고 수를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(request.getParameter("price").isEmpty()) {
		%><script>alert("가격을 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	int stock = Integer.parseInt(request.getParameter("stock"));
	int price = Integer.parseInt(request.getParameter("price"));
	
	Product product = new Product();
	product.setId(id);
	product.setName(name);
	product.setDescription(des);
	product.setMaker(maker);
	product.setCategory(category);
	product.setCondition(con);
	product.setPrice(price);
	product.setStock(stock);
	
	int result = ProductDao.getInstance().update(product);
	if(result != 0)
		response.sendRedirect("updateForm.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>