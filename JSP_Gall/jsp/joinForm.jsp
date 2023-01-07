<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {display: inline-block; padding: 30px; width: 80%; border: 1px solid black;}
	body {text-align: center;}
	input {margin: 3px;}
	.input {width: 500px; height: 30px; margin-left: 60px;}
	#join {width: 607px; height: 40px; border: none;}
	.button {width: 110px; height: 30px;}
	input[name=pwCheck] {margin-left: 170px;}
	input[name=name] {width: 400px;}
	input[name=email] {width: 150px; margin-left: 0}
	select {height: 37px;}
</style>
</head>
<body>
	<div align=center>
		<form action="join.jsp" method=post>
			<table>
				<tr>
					<td>개인 식별 코드<input type=text placeholder="개인 식별 코드" class=input name=id></td>
				</tr>
				<tr>
					<td>비밀번호 입력<input type=password placeholder="비밀번호를 입력해 주세요." class=input name=pw></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호를 재확인해 주세요." class=input name=pwCheck></td>
				</tr>
				<tr>
					<td>
						닉네임 만들기<input type=text placeholder="닉네임을 입력해 주세요." class=input name=name>
						<select>
							<option>비고정닉
							<option>고정닉
						</select>
					</td>
				</tr>
				<tr>
					<td>
						보안 코드 발급 이메일<input type="text" class=input name=email> @
						<input type="text" class=input name=email>
						<select>
							<option>이메일 선택
							<option>naver.com
							<option>직접 입력
						</select>
					</td>
				</tr>
				<tr>
					<td><input type=text placeholder="직업" class=input name=job></td>
				</tr>
				<tr>
					<td><input type=submit value=회원가입 id=join></td>
				</tr>
				<tr>
					<td><input type=reset value=다시입력 class=button>
					<input type=button value=이전 onclick="location.href='loginForm.jsp'" class=button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>