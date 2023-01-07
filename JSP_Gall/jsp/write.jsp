<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {width: 60%;  margin-left: 20%;}
	h2 {color: #29367c}
	#outside {border: 2px solid #d5d5d5; height: 650px; border-top-color: #3b4890;
	padding: 33px 68px 5px;}
	input[name=nick],input[name=pw] {width: 230px; height: 30px;}
	input[name=title] {width: 730px; height: 30px; margin: 10px 0 20px;}
	input[type=submit],button {float: right; width: 85px; height: 40px;
	background: #3b4890; color: white; border: 1px solid #29367c;
	border-bottom-width: 3px; margin-top: 10px; font-weight: bold;
	border-radius: 2px; cursor: pointer; margin-right: 10px;}
	button {background: #666; border-color: #444; }
</style>
</head>
<body>
	<header>
		<h1>Minami.com</h1>
	</header>
	<section>
		<h2>테스트 갤러리</h2>
		<div id=outside>
			<form action="upload.jsp" method=post>
				<div>
					<input type=text placeholder=닉네임 name=nick>
					<input type=password placeholder=비밀번호 name=pw>
				</div>
				<div><input type=text placeholder="제목을 입력해 주세요." name=title></div>
				<textarea rows="30" cols="140" name=content></textarea><br>
				<input type=submit value=등록>
			</form>
			<button onclick=history.back()>취소</button>
		</div>
	</section>
</body>
</html>