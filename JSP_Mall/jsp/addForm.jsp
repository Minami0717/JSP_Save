<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("id") == null || !session.getAttribute("id").equals("admin")) {
		%><script>alert("접근 권한이 없습니다."); history.back()</script><%
		return;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Minami Mall</title>
<style>
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
	#form {margin-left: 40%;}
	input[type=text],input[type=number] {height: 35px;}
	input[type=file] {border: 1px solid black; padding: 10px;}
	form div {margin: 10px;}
	input[type=submit] {height: 35px; width: 55px; background: aqua; border: none; border-radius: 5px;}
	label {width: 100px; display: inline-block;}
	#d {width: 300px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>상품 등록</h1></div>
	<div id=form>
		<form action=addPD.jsp method=post enctype="multipart/form-data">
			<div><label for=i>상품 코드</label><input type=text name=id id=i></div>
			<div><label for=na>상품 이름</label><input type=text name=name id=na></div>
			<div><label for=p>가격</label><input type="number" name=price id=p></div>
			<div><label for=d>상세 내용</label><input type=text name=des id=d></div>
			<div><label for=m>제조사</label><input type="text" name=maker id=m></div>
			<div><label for=c>분류</label><input type="text" name=category id=c></div>
			<div><label for=s>재고 수</label><input type="number" name=stock id=s></div>
			<div>
				<label for=n>상태</label>
				<span>
					<input type="radio" id=n name=condition value=New>
					<label for=n>신규 제품</label>
					<input type="radio" id=o name=condition value=Old>
					<label for=o>중고 제품</label>
					<input type="radio" id=r name=condition value=Refurbished>
					<label for=r>재생 제품</label>
				</span>
			</div>
			<div><label for=im>상품 이미지</label><input type="file" name=image id=im></div>
			<div><input type=submit value=등록></div>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>