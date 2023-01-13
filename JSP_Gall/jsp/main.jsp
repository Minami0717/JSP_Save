<%@page import="gall.GallListDao"%>
<%@page import="gall.GallList"%>
<%@page import="gall.PostDao"%>
<%@page import="gall.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int idx = 1;
	List<Post> list = PostDao.getInstance().selectAll(idx);
%>
<html>
<head>
<meta charset="UTF-8">
<title>minami.com</title>
<style>
	h4,h5 {color: #3b4890; display: inline-block;}
    h5 {margin-left: 10px;}

    section {margin-left: 25%; width: 35%; height: 700px; float: left;}
	aside {float: right; margin-right: 25%;}
	button {cursor: pointer;}

	#login {border: 1px solid #3b4890; padding: 10px; margin: 15px 0; width: 240px;}
	#login input:not([type=checkbox]) {width: 145px; height: 37px;}
	#login button {width: 65px; height: 37px; background: #3b4890; color: white; border: none; border: 1px solid #29367c;}
	#login img {width: 15px; height: 15px;}
	#login div:first-child {margin-bottom: 5px; font-size: 12px;}
	#login div:last-child {border-top: 1px dashed black; margin-top: 10px; font-size: 12px; padding: 5px 0;}

	#hit > img {width: 150px; margin: 10px 5px;}
    #hit div img {width: 10px;}
    #hit button {background-color: #3b4890; border: 1px solid #29367c; padding: 2px 4px; margin: 0;}
	#hit > div, #best div {border-bottom: 2px solid #3b4890; padding: 10px 0;}

	#best img {height: 20px; padding: 0 5px;}
    #best img:last-child {height: 10px;}
	#best h4 a,#best h5 a {color: #3b4890;}
	#best li {list-style-type: none; border-bottom: 1px solid gainsboro; padding: 10px 0;}
    #best span {color: coral;}

	#silbuk {border: 1px solid black; width: 260px;}
	#silbuk h4 {color: black;}
	#silbuk a {font-size: 12px;}
	#silbuk div:first-child {border-bottom: 1px dashed gainsboro; padding-bottom: 10px; margin: 10px;}
	#silbuk ol {padding: 0 30px;}

	ol a {color: black;}
	#rank {background: gainsboro; padding: 10px; font-size: 12px;
			text-align: right; margin-top: 10px;}
	#ad img {width: 260px; margin: 15px 0;}
	#inline {display: inline-block; margin-left: 70px;}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div id=hit>
			<div>
				<h4>HIT 갤러리</h4>
                <div class="right">
                    1/3
                    <button><img src="image/play-button2.png"></button><button><img src="image/play-button.png"></button>
                </div>
			</div>
			<img src="image/test.jpg">
			<img src="image/test.jpg">
			<img src="image/test.jpg">
			<img src="image/test.jpg">
		</div>
		<div id=best>
			<div>
				<h4><a href=#>실시간 베스트<img src=image/check.png></a></h4>
                <h4><a href=#>실베<span>라이트</span><img src=image/check2.png></a></h4>
                <h5><a href=#>실갤<img src=image/play.png id="s"></a></h5>
			</div>
			<ul>
			<%
				for (Post p : list) {
					%><li><a href="result.jsp?idx=<%= idx %>&p_idx=<%= p.getIdx() %>"><%=p.getTitle() %></a><%
				}
			%>
			</ul>
		</div>
	</section>
	<aside>
		<div id=login>
			<div>
				<input type=text placeholder="식별 코드">
				<input type=checkbox> 코드 저장
			</div>
			<div>
				<input type=password placeholder="비밀번호">
				<button onclick="location.href='loginForm.jsp'">로그인</button>
			</div>
			<div>
				<b>고정닉 신청</b> | 식별 코드·비밀번호 찾기 |
				<img src=image/bell.png>
			</div>
		</div>
		<div id=silbuk>
			<div>
				<h4>실북갤</h4>
				<div id=inline>
					<a href=#>메인 |</a>
                    <a href=#><span style="color: red;">마이너</span> |</a>
                    <a href=#><span style="color: blue;">미니</span></a>
				</div>
			</div>
			<ol>
			<%
				for (GallList g : gList) {
					%><li><a href="gallMain.jsp?idx=<%= g.getIdx() %>"><%=g.getName() %></a><%
				}
			%>
			</ol>
			<div id=rank>11위 - 20위</div>
		</div>
		<div id=ad><img src=image/digital1.jpg></div>
	</aside>
	<footer>
	
	</footer>
</body>
</html>