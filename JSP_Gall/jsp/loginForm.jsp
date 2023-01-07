<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {display: inline-block; padding: 30px; border: 2px solid #3b4890;}
	body {text-align: center;}
	input {margin: 3px;}
	.input {width: 280px; height: 30px; background: #f3f3f3; border: none;}
	#login {width: 287px; height: 40px; background-color: #3b4890;
	color: white; border: none;}
	.button {height: 30px;}
	a {text-decoration: none; color: black;}
</style>
</head>
<body>
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
				<!-- <tr>
					<td><input type=reset value=다시입력 class=button>
					<input type=button value=처음으로 onclick="location.href='main.jsp'" class=button>
					<input type=button value=회원가입 onclick="location.href='joinForm.jsp'" class=button></td>
				</tr> -->
			</table>
			<hr>
			<a href=#>식별 코드 찾기</a> | <a href=#>비밀번호 찾기</a> | <a href=joinForm.jsp>고정닉 신청</a>
		</form>
	</div>
</body>
</html>