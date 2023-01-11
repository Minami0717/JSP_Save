<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
	
	input {margin: 5px;}
	.input {width: 200px; height: 30px; background: #f3f3f3; border: none;}
	#join {width: 330px; height: 40px; background-color: #3b4890; color: white; border: none; cursor: pointer;}
	
	#jForm {margin: 20px;}
	label:not(label[for=m]) {display: inline-block; width: 120px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>회원가입</h1></div>
	<div align=center id=jForm>
		<form action="join.jsp" method=post>
			<table>
				<tr>
					<td>
						<label for=i>아이디</label>
						<input type=text class=input name=id id=i>
					</td>
				</tr>
				<tr>
					<td>
						<label for=p>비밀번호</label>
						<input type=password class=input name=pw id=p>
					</td>
				</tr>
				<tr>
					<td>
						<label for=pc>비밀번호 확인</label>
						<input type=password class=input name=pwCheck id=pc>
					</td>
				</tr>
				<tr>
					<td>
						<label for=n>이름</label>
						<input type=text class=input name=name id=n>
					</td>
				</tr>
				<tr>
					<td>
						<label for=w>성별</label>
						<input type="radio" name=gender id=m value=남><label for=m>남</label>
						<input type="radio" name=gender id=w value=여><label for=w>여</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for=b>생일</label>
						<input type="date"class=input name=birth id=b>
					</td>
				</tr>
				<tr>
					<td>
						<label for=e>이메일</label>
						<input type="email" class=input name=email id=e>
					</td>
				</tr>
				<tr>
					<td>
						<label for=ph>휴대폰 번호</label>
						<input type=tel class=input name=phone id=ph>
					</td>
				</tr>
				<tr>
					<td>
						<label for=a>주소</label>
						<input type="text" class=input name=address id=a>
					</td>
				</tr>
				<tr>
					<td><input type=hidden name=regist_day value=<%=LocalDateTime.now().
					format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) %>></td>
				</tr>
				<tr>
					<td><input type=submit value=회원가입 id=join></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>