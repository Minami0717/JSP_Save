<%@page import="mall.OrderDao"%>
<%@page import="mall.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<Order> list = OrderDao.getInstance().selectAll(session.getAttribute("id").toString());
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
	td {text-align: center;}
	button {background: red; color: white; cursor: pointer; border: none;
		border-radius: 5px; padding: 3px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>주문 목록</h1></div>
	<table>
		<tr>
			<th width=400px>주문일자
			<th width=450px>상품
			<th width=200px>가격
			<th width=100px>수량
			<th width=200px>소계
			<th width=200px>비고
		<%
			for (Order o : list) {
				total += o.getPrice()*o.getCount();
				%><tr>
					<td><%=o.getDate() %>
					<td><%=o.getProduct() %>
					<td><%=o.getPrice() %>
					<td><%=o.getCount() %>
					<td><%=o.getPrice()*o.getCount() %>
					<td><button onclick=cancel(<%=o.getIdx()%>)>주문 취소</button><%
			}
		%>
		<tr>
			<td><td><td><td><b>총액</b><td><b><%=total %></b><td>
	</table>
</body>
<script>
	function cancel(idx) {
		if (confirm("주문을 취소할까요?"))
			location.href="delOrder.jsp?idx="+idx
	}
</script>
</html>