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
	button,input[type=submit] {background: dodgerblue; cursor: pointer; border: none; color: white;
		font-size: 16px; width: 120px; border-radius: 5px; padding : 10px;}
	button:last-child {background: maroon;}
	input {font-size: 16px;}
	label {display: inline-block; width: 80px;}
	input[name=des] {width: 300px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>상품 수정</h1></div>
	<div id=info>
		<img src="image/<%=product.getImage()%>">
		<div class=inline>
			<form action=productUpdate.jsp method=post>
				<p><label>상품 코드</label> <span><%=product.getId() %></span><input type=hidden value=<%=product.getId() %> name=id>
				<p><label for=na>이름</label> <input type=text value="<%=product.getName() %>" name=name id=na>
				<p><label for=p>가격</label> <input type=number value="<%=product.getPrice() %>" name=price id=p>
				<p><label for=d>설명</label> <input type=text value="<%=product.getDescription() %>" name=des id=d>
				<p><label for=m>제조사</label> <input type=text value="<%=product.getMaker() %>" name=maker id=m>
				<p><label for=c>분류</label> <input type=text value="<%=product.getCategory() %>" name=category id=c>
				<p><label for=s>재고 수</label> <input type=number value="<%=product.getStock() %>" name=stock id=s>
				<p>
					<label>상태</label>
					<%
						if (product.getCondition().equalsIgnoreCase("new")) {
							%><input type=radio value="New" name=con id=n checked>
							<label for=n>신규 제품</label>
							<input type=radio value="Old" name=con id=o>
							<label for=o>중고 제품</label>
							<input type=radio value="Refurbished" name=con id=r>
							<label for=r>재생 제품</label><%
						}
						else if (product.getCondition().equalsIgnoreCase("old")) {
							%><input type=radio value="New" name=con id=n>
							<label for=n>신규 제품</label>
							<input type=radio value="Old" name=con id=o checked>
							<label for=o>중고 제품</label>
							<input type=radio value="Refurbished" name=con id=r>
							<label for=r>재생 제품</label><%
						}
						else {
							%><input type=radio value="New" name=con id=n>
							<label for=n>신규 제품</label>
							<input type=radio value="Old" name=con id=o>
							<label for=o>중고 제품</label>
							<input type=radio value="Refurbished" name=con id=r checked>
							<label for=r>재생 제품</label><%
						}
					%>
				</p>
				<p><input type=submit value="상품 수정">
				<button type=button onclick="location.href='updateForm.jsp'">이전</button>
			</form>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>