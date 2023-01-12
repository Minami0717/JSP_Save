<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Minami Mall</title>
<style>
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
	#form {margin-left: 40%;}
	input {height: 35px;}
	input[type=date] {width: 170px;}
	form div {margin: 10px;}
	input[type=submit],input[type=button],input[type=reset] {width: 55px; background: darkslateblue; border: none;
		border-radius: 5px; color: white; cursor: pointer;}
	input[type=button],input[type=reset] {background: gray;}
	label {width: 100px; display: inline-block;}
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
				<input type=reset value=초기화>
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