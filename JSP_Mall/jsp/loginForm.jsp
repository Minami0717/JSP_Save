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
	
	input {margin: 3px;}
	.input {width: 280px; height: 30px; background: #f3f3f3; border: none;}
	#login {width: 280px; height: 40px; background-color: #3b4890; color: white; border: none; cursor: pointer;}
	
	#lForm {margin: 20px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>로그인</h1></div>
	<div align=center id=lForm>
		<form action="checkID.jsp" method=post>
			<table>
				<tr>
					<td><input type=text placeholder="아이디" class=input name=id></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호" class=input name=pw></td>
				</tr>
				<tr>
					<td><input type=submit value=로그인 id=login></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>