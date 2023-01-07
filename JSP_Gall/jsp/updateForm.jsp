<%@page import="friend.Friend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {background-color: cornflowerblue; display: inline-block;
		 padding: 50px;}
	body {background-color: aqua; text-align: center;}
	input {margin: 3px;}
	.input {width: 223px; height: 30px;}
	#join {width: 230px; height: 40px; background-color: khaki; border: none;}
	.button {width: 230px; height: 30px; background: greenyellow; border: none;}
</style>
</head>
<body>
	<div align=center>
		<h1>회원정보수정</h1>
		<form action="update.jsp" method=post>
			<table>
				<tr>
					<td><input type=text placeholder="아이디" class=input name=id
					value=<%= session.getAttribute("id") %> readonly></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호" class=input name=pw></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호확인" class=input name=pwCheck></td>
				</tr>
				<tr>
					<td><input type=text placeholder="이름" class=input name=name
					value=<%= session.getAttribute("name") %> readonly></td>
				</tr>
				<tr>
					<td><input type="number" placeholder="나이" class=input name=age
					value=<%= session.getAttribute("age") %>></td>
				</tr>
				<tr>
					<td><input type=text placeholder="직업" class=input name=job
					value=<%= session.getAttribute("job") %>></td>
				</tr>
				<tr>
					<td><input type=submit value=정보수정 id=join></td>
				</tr>
				<tr>
					<td><input type=button value=취소 onclick="location.href='loginSucc.jsp'" class=button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>