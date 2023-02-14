<%@page import="java.time.LocalDate"%>
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
	List<Post> list = PostDao.getInstance().selectBest();
%>
<html>
<head>
<meta charset="UTF-8">
<title>minami.com</title>
<style>
	h4,h5 {color: #d2af8a; display: inline-block;}
	h4 a {color: #d2af8a;}

    section {width: 670px; float: left;}
	aside {float: right;}
	button {cursor: pointer;}
	ol a {color: black;}

	#login,#user_info {border: 1px solid #d2af8a; padding: 10px; margin: 15px 0; width: 240px;}
	#login input[name=code],#login input[name=pw] {width: 145px; height: 37px; background: #f3f3f3; border: none; padding-left: 5px;}
	#login input[type=submit],#user_info button {width: 65px; height: 37px; background: #d2af8a; color: white; border: none; border: 1px solid #d2af8a; margin-left: 10px; cursor: pointer;}
	#login img {height: 13px; cursor: pointer;}
	#login div:first-child {margin-bottom: 5px; font-size: 12px;}
	#login > div:last-child {border-top: 1px dashed #aaa; margin-top: 15px; font-size: 12px; padding: 10px 0 5px; text-align: center;}
	#login input[type=checkbox] {margin-left: 10px;}
	#login span {font-size: 11px;}
	
	#user_info button {height: 25px; font-weight: bold;}
	#user_info span {border: 1px #ccc solid; background: #f3f3f3; color: #555; width: 68px; height: 25px; font-size: 13px; display: inline-block; text-align: center; padding-top: 5px; margin-bottom: 5px;}
	#user_info > div {margin-left: 10px;}
	#user_info div:first-child a {color: #d2af8a; font-size: 14px;}
	#user_info div:first-child a:hover {text-decoration: none;}
	#user_info div:last-child {margin-top: 10px;}
	#user_info div:nth-child(2) {font-size: 13px; margin: 10px;}
	#user_info div:nth-child(2) a {color: #d2af8a;}
	#user_info img {height: 13px; cursor: pointer;}

	#hit > img {width: 150px; margin: 10px 5px;}
    #hit div img {width: 10px;}
    #hit button {background-color: #d2af8a; border: 1px solid #d2af8a; padding: 2px 4px; margin: 0;}
	#hit > div, #best > div {border-bottom: 2px solid #d2af8a; padding: 10px 0;}
	#hit span {font-size: 12px;}

	#best img {height: 20px; padding: 0 5px;}
    #best img:last-child {height: 10px;}
	#best h4 a,#best h5 a {color: #d2af8a;}
	#best li {list-style-type: none; border-bottom: 1px solid gainsboro; padding: 10px 0; cursor: pointer;}
	#best li a {font-weight: bold; font-size: 14px;}
	#best li div:first-of-type {width: 510px;}
	#best li div:last-of-type {text-align: right;}
    #best h4 span {color: coral;}
    #best ul {border-bottom: 1px solid  #d2af8a;}
    #best ul div {display: inline-block;}
    #best li:hover a {text-decoration: underline;}

	#silbuk {border: 1px solid #ccc; width: 260px;}
	#silbuk h5 {color: black; font-size: 14px;}
	#silbuk a {font-size: 12px;}
	#silbuk div:first-child {border-bottom: 1px dashed gainsboro; padding-bottom: 10px; margin: 10px;}
	#silbuk ol {padding: 0 10px;}
	#silbuk ol span:first-child {background: #d2af8a; color: white; width: 14px; font-weight: bold; display: inline-block; text-align: center; height: 13px; font-size: 9px;}
	#silbuk ol span:last-child:hover {text-decoration: underline;}
	#silbuk li {list-style-type: none; margin: 5px 5px;}
	#silbuk li a:hover {text-decoration: none;}
	
	#inline {display: inline-block; margin-left: 40px;}
	#inline a {
		cursor: pointer;
	}
	#inline a:before {
		content: "";
	    display: inline-block;
	    width: 1px;
	    height: 10px;
	    margin: 0 8px 0 3px;
	    vertical-align: -1px;
	    background: #d7d7d7;
	}
	#inline a:first-child:before {
		display: none;
	}
	#inline a:hover {
		text-decoration: underline currentColor;
	}
	#inline a:nth-child(2) {
		color: #ff6600;
	}
	#inline a:last-child {
		color: #6f6dd9;
	}
	
	#rank {background: gainsboro; padding: 10px; font-size: 12px; text-align: right; margin-top: 10px; text-decoration: underline; cursor: pointer;}
	#ad img {width: 260px; margin: 15px 0;}
	
	#name, #date {font-size: 12px; color: #555;}
	#name {width: 100px; display: inline-block;}
	#date::before {content: ""; display: inline-block; width: 1px; height: 9px; background: #aaa; margin: 0 6px;}
	#rn {color: #d31900; font-size: 14px;}
	
	#main_content {
		width: 950px;
	    margin: 17px auto 0;
	}
	#main_content:after {
		display: table;
	    clear: both;
	    table-layout: fixed;
	    content: "";
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	const n = Math.floor(Math.random()*3)
	console.log(document.querySelector("#inline > a:first-child"))
	document.querySelector("#inline a:first-child").style.textDecoration = 'underline';
	switch (n) {
	case 0:
		document.querySelector("#inline a:first-child").style.textDecoration = 'underline';
		break;
// 	case 1:
// 		document.querySelector("#inline a:nth-child(2)").style.textDecoration = 'underline';
// 		break;
	case 2:
		document.querySelector("#inline a:last-child").style.textDecoration = 'underline';
		break;

	default:
		break;
	}

	function main() {
		
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<main>
		<div id=main_content>
			<section>
				<div id=hit>
					<div>
						<h4><a href=gallMain.jsp?idx=2>HIT</a></h4>
		                <div class="right">
		                    <span><b>1</b>/3</span>
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
		                <h5><a href=gallMain.jsp?idx=1>실베<img src=image/play2.png id="s"></a></h5>
					</div>
					<ul>
					<%
						for (int i = list.size()-1; i >= 0; i--) {
							GallList gall = GallListDao.getInstance().selectOne(list.get(i).getGall_idx());
							String date;
							if (!list.get(i).getDate().substring(0,10).equals(LocalDate.now().toString()))
								date = list.get(i).getDate().substring(5,7)+"-"+list.get(i).getDate().substring(8,10);
							else
								date = list.get(i).getDate().substring(11,16);
							
							%><li onclick="location.href='result.jsp?idx=<%= idx %>&p_idx=<%= list.get(i).getIdx() %>'">
								<div>
									<a href="result.jsp?idx=<%= idx %>&p_idx=<%= list.get(i).getIdx() %>"><%=list.get(i).getTitle() %></a>
									<span id=rn>[<%=list.get(i).getReplyNum() %>]</span>
								</div>
								<div><span id=name><%=gall.getName() %></span><span id=date><%=date %></span></div>
							<%
						}
					%>
					</ul>
				</div>
			</section>
			<aside>
				<%
					if (session.getAttribute("code") == null) {
					%>
					<div id=login>
						<form action=checkID.jsp?url=<%= request.getRequestURL() %> method=post>
							<div>
								<input type=text placeholder="아이디" name=code>
								<span><input type=checkbox> 아이디 저장</span>
							</div>
							<div>
								<input type=password placeholder="비밀번호" name=pw>
								<input type=submit value=로그인>
							</div>
						</form>
						<div>
							<b><a href=joinForm.jsp>회원가입</a></b> |
							<a href=#>아이디</a> · <a href=#>비밀번호 찾기</a> |
							<img src=image/bell.png>
						</div>
					</div>
					<%
					}
					else {
					%>
					<div id=user_info>
						<div>
							<a href=#><b><%=session.getAttribute("nick") %></b>님<img src=image/right-arrow3.png></a>
							<button onclick="location.href='logout.jsp?url=<%=request.getRequestURL()%>'">로그아웃</button>
						</div>
						<div>
							글 <a href=#>0</a> 댓글 <a href=#>0</a> 방명록 <a href=#>0</a>
						</div>
						<div>
							<span><a href=#>MY블로그</a></span>
							<span><a href=#>고정닉정보</a></span>
							<span><a href=#>상품권</a></span>
							<span><a href=#>즐겨찾기</a></span>
							<span><a href=#>운영/가입</a></span>
							<span><a href=#><img src=image/bell.png>알림</a></span>
						</div>
					</div>
					<%
					}
				%>
				<div id=silbuk>
					<div>
						<h5>실시간 순위</h5>
						<div id=inline>
							<a class=main_color onclick=main()>메인</a>
		                    <a onclick=minor()>마이너</a>
		                    <a onclick=mini()>미니</a>
						</div>
					</div>
					<ol>
					<%
						for (GallList g : gList) {
							%>
							<li>
								<a href="gallMain.jsp?idx=<%= g.getIdx() %>">
									<span><%= g.getIdx() %></span>
									<span><%=g.getName() %></span>
								</a>
							</li>
							<%
						}
					%>
					</ol>
					<ol style=display:none>
					<%
						for (GallList g : gList) {
							%>
							<li>
								<a href="gallMain.jsp?idx=<%= g.getIdx() %>">
									<span><%= g.getIdx() %></span>
									<span><%=g.getName() %></span>
								</a>
							</li>
							<%
						}
					%>
					</ol>
					<div id=rank>11위 - 20위</div>
				</div>
				<div id=ad><a href=http://www.kcd.or.kr><img src=image/digital1.jpg></a></div>
			</aside>
		</div>
	</main>
	<footer>
	</footer>
</body>
</html>