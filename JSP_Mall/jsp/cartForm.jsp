<%@page import="mall.CartDao"%>
<%@page import="mall.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<Cart> list = CartDao.getInstance().selectAll();
	int total = 0;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Minami Mall</title>
<style>
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
	table {margin-left: 30%; margin-top: 50px; margin-right: 30%;}
	th,td {border-top: 1px solid gainsboro; height: 50px;}
	th {text-align: left;}
	button {background: red; color: white; cursor: pointer; border: none;
		border-radius: 5px; padding: 3px;}
	#del{margin-left: 30%; margin-top: 50px;}
	#order {background: green; margin-left: 33%;}
	#con {background: gray; margin-left: 30%;}
	.btn {padding: 5px 10px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>장바구니</h1></div>
	<button id=del class=btn onclick=del()>삭제하기</button>
	<button id=order class=btn onclick="location.href='orderForm.jsp'">주문하기</button>
	<table>
		<tr>
			<th width=400px>상품
			<th width=200px>가격
			<th width=100px>수량
			<th width=200px>소계
			<th width=100px>비고
		<%
			for (Cart c : list) {
				total += c.getPrice()*c.getCount();
				%><tr>
					<td><%=c.getId()+" - "+c.getProduct() %>
					<td><%=c.getPrice() %>
					<td><%=c.getCount() %>
					<td><%=c.getPrice()*c.getCount() %>
					<td><button onclick="location.href='delete.jsp?id=<%=c.getId()%>'">삭제</button><%
			}
		%>
		<tr>
			<td><td><td><b>총액</b><td><b><%=total %></b><td>
	</table>
	<button id=con class=btn onclick="location.href='products.jsp'">&laquo;쇼핑 계속하기</button>
	<%@include file="footer.jsp" %>
</body>
<script>
	function del() {
		if(confirm("전부 삭제할까요?"))
			location.href="deleteAll.jsp";
		else
			return;
	}
</script>
</html>