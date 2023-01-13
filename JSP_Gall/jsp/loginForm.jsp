<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {margin: 0; padding: 0;}
	header {background: #29367c; padding: 20px 25% 10px;}
	header a {color: white;}
	div[align=center] {display: inline-block; border: 2px solid #3b4890; margin: 10%;}
	div[align=center] div {float: right; background: #f3f3f3; padding: 50px 30px;}
	form {float: left; padding: 40px;}
	body {text-align: center;}
	input {margin: 3px;}
	.input {width: 280px; height: 40px; background: #f3f3f3; border: none;}
	#login {width: 280px; height: 40px; background-color: #3b4890;
	color: white; border: none;}
	.button {height: 30px;}
	a {text-decoration: none; color: black;}
	img {width: 250px;}
</style>
</head>
<body>
	<header>
		<h1 align=left><a href=main.jsp>minami.com</a> <a href=loginForm.jsp>로그인</a></h1>
	</header>
	<div align=center>
		<form action="checkID.jsp" method=post>
			<table>
				<tr>
					<td><input type=text placeholder="식별 코드" class=input name=code></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호" class=input name=pw></td>
				</tr>
				<tr>
					<td><input type=submit value=로그인 id=login></td>
				</tr>
				<tr>
					<td><input type="checkbox">식별 코드 저장
				</tr>
			</table>
			<hr>
			<a href=#>식별 코드 찾기</a> | <a href=#>비밀번호 찾기</a> | <a href=joinForm.jsp>고정닉 신청</a>
		</form>
		<div>
			<img src=image/banner1.png>
		</div>
	</div>
</body>
</html>