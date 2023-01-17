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
	
	header {background: #29367c; position: relative; height: 85px;}
	header a {color: white;}
	header li {font-size: 11px; color: #ccc; margin-left: 5px;}
	header li a:hover {text-decoration: underline;}
	header ul {position: absolute; right: 30%; top: 50px;}
	header h1 {position: absolute; left: 30%; top: 30px;}
	
	section {width: 40%; margin: 0 30%;}
	section div:first-child {border-bottom: 2px solid #29367c; padding: 10px 0; margin-top: 50px;}
	section div:first-child h4 {color: #29367c}
	section div:nth-child(2) {border: 1px #cecdce solid; border-radius: 5px; margin: 25px 0; padding: 30px 50px;}
	
	table label {font-weight: bold; font-size: 14px; display: inline-block; width: 180px;}
	td {padding: 10px;}
	
	input {margin: 3px;}
	.input {width: 450px; height: 30px;}
	#join {width: 635px; height: 40px; border: none; background: #29367c; color: white; cursor: pointer; margin-top: 10px;}
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
			<h4 align=left>회원 가입 완료</h4>
		</div>
		<div>
			<button onclick="location.href='main.jsp'">메인으로</button>
		</div>
	</section>
</body>
</html>