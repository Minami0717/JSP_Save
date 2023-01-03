<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
	#form {margin-left: 40%;}
	input[type=text],input[type=number] {height: 35px; margin: 0 100px;}
	textarea {margin-left: 100px; width: 300px; height: 30px;}
	input[name=price],input[name=category],span {margin-left: 140px;}
	input[name=maker],input[name=stock] {margin-left: 120px;}
	input[type=file] {margin-left: 90px; border: 1px solid black; padding: 10px;}
	form div {margin: 10px;}
	input[type=submit] {height: 35px; width: 55px; background: aqua; border: none;
		border-radius: 5px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>상품 등록</h1></div>
	<div id=form>
		<form action=addPD.jsp method=post>
			<div>상품 코드<input type=text name=id></div>
			<div>상품 이름<input type=text name=name></div>
			<div>가격<input type="number" name=price></div>
			<div>상세 내용<textarea name=des></textarea></div>
			<div>제조사<input type="text" name=maker></div>
			<div>분류<input type="text" name=category></div>
			<div>재고 수<input type="number" name=stock></div>
			<div>상태
				<span>
					<input type="radio" id=n name=condition value=New>
					<label for=n>신규 제품</label>
					<input type="radio" id=o name=condition value=Old>
					<label for=o>중고 제품</label>
					<input type="radio" id=r name=condition value=Refurbished>
					<label for=r>재생 제품</label>
				</span>
			</div>
			<div>상품 이미지<input type="file" name=image></div>
			<div><input type=submit value=등록></div>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>