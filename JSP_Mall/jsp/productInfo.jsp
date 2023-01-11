<%@page import="mall.ProductDao"%>
<%@page import="mall.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	Product product = ProductDao.getInstance().selectOne(id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Minami Mall</title>
<style>
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
	#info {margin-left: 35%; margin-right: 10%;}
	img {height: 230px;}
	.inline {display: inline-block; margin-top: 20px;}
	p {margin: 10px 0;}
	span {background: red; color: white; border-radius: 5px;
		padding: 2px;}
	.button {border-radius: 5px; padding : 10px;
		width: 100px; display: inline-block; margin: 3px;}
	button {background: dodgerblue; cursor: pointer; border: none; color: white;
		font-size: 16px; width: 120px; border-radius: 5px; padding : 10px;}
	#list {background: maroon;}
	#cart {background: olive;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>상품 정보</h1></div>
	<div id=info>
		<img src="image/<%=product.getImage()%>">
		<div class=inline>
			<h2><%=product.getName() %></h2>
			<p><%=product.getDescription() %>
			<p>상품 코드 : <span><%=product.getId() %></span>
			<p>제조사 : <%=product.getMaker() %>
			<p>분류 : <%=product.getCategory() %>
			<p>재고 수 : <%=product.getStock() %>
			<h2><%=product.getPrice() %>원</h2>
			<button onclick=order()>상품 주문 >></button>
			<p class=button id=cart><a href=cartForm.jsp>장바구니 >></a>
			<p class=button id=list><a href=products.jsp>상품 목록 >></a>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
<script>
	function order() {
		if (confirm("상품을 장바구니에 추가할까요?"))
			location.href="addCart.jsp?id=<%=product.getId()%>";
		else
			return;
	}
</script>
</html>