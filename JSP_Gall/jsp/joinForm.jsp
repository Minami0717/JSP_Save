<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {margin: 0; padding: 0;}
	a {text-decoration: none;}
	li,ul,h1 {display: inline-block;}
	
	header {background: #d2af8a; position: relative; height: 85px;}
	header a {color: white;}
	header li {font-size: 11px; color: #ccc; margin-left: 5px;}
	header li a:hover {text-decoration: underline;}
	header ul {position: absolute; right: 30%; top: 50px;}
	header h1 {position: absolute; left: 30%; top: 30px;}
	
	section {width: 40%; margin: 0 30%;}
	section div:first-child {border-bottom: 2px solid #d2af8a; padding: 10px 0; margin-top: 50px;}
	section div:first-child h4 {color: #d2af8a}
	section div:nth-child(2) {border: 1px #cecdce solid; border-radius: 5px; margin: 25px 0; padding: 30px 50px;}
	
	table label {font-weight: bold; font-size: 14px; display: inline-block; width: 180px;}
	td {padding: 10px;}
	
	input {margin: 3px;}
	.input {width: 450px; height: 30px;}
	#join {width: 635px; height: 40px; border: none; background: #d2af8a; color: white; cursor: pointer; margin-top: 10px;}
	.button {width: 110px; height: 30px;}
	
	input[name=nick] {width: 363px;}
	input[name=pwCheck] {margin-left: 183px;}
	input[name=email1],input[name=email2] {width: 155px;}
	select {height: 37px;}
</style>
</head>
<body>
	<header>
		<h1><a href=main.jsp>minami.com</a></h1>
		<ul>
			<li><a href=>갤러리</a> |
			<li><a href=>마이너갤</a> |
			<li><a href=>미니갤</a> |
			<li><a href=>갤로그</a> |
			<li><a href=>뉴스</a> |
			<li><a href=>게임</a> |
			<li><a href=>위키</a> |
			<li><a href=>이벤트</a> |
			<li><a href=>이모티콘</a>
		</ul>
	</header>
	<section>
		<div>
			<h4 align=left>기본 정보 입력</h4>
		</div>
		<div>
			<form action="join.jsp" method=post>
				<table>
					<tr>
						<td><label>개인 식별 코드</label><input type=text placeholder="개인 식별 코드를 입력해 주세요." class=input name=code></td>
					</tr>
					<tr>
						<td><label>비밀번호 입력</label><input type=password placeholder="비밀번호를 입력해 주세요." class=input name=pw></td>
					</tr>
					<tr>
						<td><input type=password placeholder="비밀번호를 재확인해 주세요." class=input name=pwCheck></td>
					</tr>
					<tr>
						<td>
							<label>닉네임 만들기</label><input type=text placeholder="닉네임을 입력해 주세요." class=input name=nick>
							<select name=fixed>
								<option value=false>비고정닉
								<option value=true>고정닉
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>보안 코드 발급 이메일</label><input type="text" class=input name=email1> @
							<input type="text" class=input name=email2>
							<select>
								<option>이메일 선택
								<option>naver.com
								<option>직접 입력
							</select>
						</td>
					</tr>
					<tr>
						<td><input type=submit value=회원가입 id=join></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>
</html>