<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	main {width: 960px; margin: 20px auto 0;}
	button {cursor: pointer;}
	
	#login {border: 1px solid #d2af8a; width: 270px;}
	#login img {height: 13px;}
	#login p {padding: 10px 20px;}
	#login p a {color: #d2af8a; font-weight: bold; font-size: 14px;}
	#login p a:hover {text-decoration: none;}
	#login div {background: #f3f3f3; padding: 10px; text-align: center;}
	#login div a {font-size: 12px; font-weight: bold;}
	#login button {width: 65px; height: 25px; background: #d2af8a; color: white; border: none; border: 1px solid #d2af8a;
	margin-left: 10px; cursor: pointer; font-weight: bold; float: right;}
	
	.left_content {float: left; width: 670px;}
	.right_content {float: right; width: 270px;}
	
	.txt{float: left; height: 33px; line-height: 33px; font-size: 14px; color: #333; font-weight: bold;}
	.txt button {border: none; background: none;}
	.txt img {height: 16px; vertical-align: text-top;}
	
	.main_color {color: #d2af8a;}
	.minor_make {background: #ff9900; border-color: #ff9900; border-radius: 50px; float: right; width: 165px; height: 32px; text-align: center; color: #fff; font-size: 14px;
	text-decoration: none; cursor: pointer; line-height: 33px;}
	.minor_make:hover {text-decoration: none;}
</style>
<script>
	function loginCheck(code) {
		if(code == null) {
			if(confirm("마이너 게시판을 만들기 위해서는 로그인이 필요합니다.\n로그인 하시겠습니까?"))
				location.href="loginForm.jsp?url=<%= request.getRequestURL() %>"
		}
		else {
			location.href="createMinorForm.jsp"
		}
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<main>
		<article>
			<section class=left_content>
				<div>
					<p class=txt>누구나 개설할 수 있는 <span class=main_color>마이너 게시판</span><button><img src=image/question-mark.png></button>를 만들어보세요.</p>
					<a class=minor_make onclick=loginCheck(<%=session.getAttribute("code") %>)>마이너 게시판 만들기</a>
				</div>
			</section>
			<section class=right_content>
				<div id=login>
					<%
						if (session.getAttribute("code") == null) {
							%>
							<p><a href=loginForm.jsp?url=<%= request.getRequestURL() %>>로그인해 주세요.</a>
							<div>
								<a href=#>MY갤로그</a> &nbsp;|&nbsp;
								<a href=#>즐겨찾기</a> &nbsp;|&nbsp;
								<a href=#><img src=image/bell.png> 알림</a>
							</div>
							<%
						}
						else {
							%>
							<p><a href=#><b><%=session.getAttribute("nick") %></b>님<img src=image/right-arrow3.png></a>
							<button onclick="location.href='logout.jsp?url=<%= request.getRequestURL() %>'">로그아웃</button>
							<div>
								<a href=#>MY갤로그</a> |
								<a href=#>즐겨찾기</a> |
								<a href=#>운영/가입</a> |
								<a href=#><img src=image/bell.png> 알림</a>
							</div>
							<%
						}
					%>
				</div>
			</section>
		</article>
		<article>
		</article>
	</main>
</body>
</html>