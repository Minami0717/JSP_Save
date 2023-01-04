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
	input[type=text],input[type=number],input[type=date] {height: 35px; margin: 0 100px;}
	textarea {margin-left: 100px; width: 300px; height: 30px;}
	input[name=date],input[name=country] {margin-left: 85px;}
	input[name=code] {margin-left: 70px;}
	form div {margin: 10px;}
	input[type=submit],input[type=button],input[type=reset] {height: 35px; width: 55px; background: darkslateblue; border: none;
		border-radius: 5px; color: white; cursor: pointer;}
	input[type=button],input[type=reset] {background: gray;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>배송 정보</h1></div>
	<div id=form>
		<form action=orderInfo.jsp method=post>
			<div><label for=name>성명</label><input type=text name=name id=name></div>
			<div><label for=date>배송일</label><input type="date" name=date id=date></div>
			<div><label for=country>국가명</label><input type="text" name=country id=country></div>
			<div><label for=code>우편번호</label><input type="text" name=code id=code></div>
			<div><label for=addr>주소</label><input type="text" name=addr id=addr></div>
			<div>
				<input type=button value=이전 onclick=back()>
				<input type=submit value=등록>
				<input type=reset value=취소>
			</div>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
<script>
	function back() {
		history.back();
	}
</script>
</html>