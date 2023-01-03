<%@page import="mall.ProductDao"%>
<%@page import="mall.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<Product> products = ProductDao.getInstance().selectAll();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#ps {text-align: center; margin-top: 5%;}
	#ps div {display: inline-block; text-align: center; padding: 10px;
		width: 300px;}
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
	button {display: block; margin-left: 28%;}
	img {height: 200px; margin-top: 10px;}
	p {margin: 10px;}
	#info {background: deeppink; border-radius: 5px; padding : 10px; width: 100px; margin-left: 90px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>상품 목록</h1></div>
	<div id=ps>
		<%
			for (Product p : products) {
				%><div>
					<h2><%=p.getName() %></h2>
					<img src="image/<%=p.getImage()%>">
					<p><%=p.getDescription() %>
					<p><%=p.getPrice() %>원
					<p id=info><a href=productInfo.jsp?id=<%= p.getId() %>>상세 정보 >></a>
				</div><%
			}
		%>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>