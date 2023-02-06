<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String url = request.getParameter("url");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {margin: 0; padding: 0;}
	header {background: #d2af8a; padding: 20px 25% 10px;}
	header a {color: white;}
	header a:hover {text-decoration: none;}
	div[align=center] {display: inline-block; border: 2px solid #d2af8a; margin: 10%; font-size: 13px;}
	div[align=center] > div {float: right; background: #f3f3f3; padding: 50px 30px;}
	form {float: left; padding: 40px;}
	form div {border-top: 1px dashed #aaa; padding: 10px 0; font-size: 14px;}
	body {text-align: center;}
	input {margin: 3px;}
	.input {width: 270px; height: 40px; background: #f3f3f3; border: none; padding: 0 5px;}
	#login {width: 280px; height: 40px; background-color: #d2af8a;
	color: white; border: none; cursor: pointer;}
	.button {height: 30px;}
	a {text-decoration: none; color: black;}
	a:hover {text-decoration: underline;}
	img {width: 250px;}
	table tr:last-child td {padding: 5px 0 10px;}
</style>
</head>
<body>
	<header>
		<h1 align=left><a href=main.jsp>minami.com</a> <a href=>로그인</a></h1>
	</header>
	<div align=center>
		<form action="checkID.jsp?url=<%= url %>" method=post>
			<table>
				<tr>
					<td><input type=text placeholder="아이디" class=input name=code></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호" class=input name=pw></td>
				</tr>
				<tr>
					<td><input type=submit value=로그인 id=login></td>
				</tr>
				<tr>
					<td><input type="checkbox"> 아이디 저장</td>
				</tr>
			</table>
			<div>
				<a href=#>아이디 찾기</a> | <a href=#>비밀번호 찾기</a> | <a href=joinForm.jsp>회원가입</a>
			</div>
		</form>
		<div>
			<img src=image/banner1.png>
		</div>
	</div>
</body>
</html>