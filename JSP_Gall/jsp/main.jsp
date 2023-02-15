<%@page import="java.util.Random"%>
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
	
	Random random = new Random();
	int n = random.nextInt(3);
%>
<html>
<head>
<meta charset="UTF-8">
<title>minami.com</title>
<style>@import url("css/main.css");</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
							<a class=main_color onclick=f_main()>메인</a>
		                    <a onclick=f_minor()>마이너</a>
		                    <a onclick=f_mini()>미니</a>
						</div>
					</div>
					<ol id=main style=display:none>
					<%
						List<GallList> main = GallListDao.getInstance().selectAll(0);
						for (int i = 0; i < main.size(); i++) {
							%>
							<li>
								<a href="gallMain.jsp?idx=<%= main.get(i).getIdx() %>">
									<span><%= i+1 %></span>
									<span><%=main.get(i).getName() %></span>
								</a>
							</li>
							<%
						}
					%>
					</ol>
					<ol id=minor style=display:none>
					<%
						List<GallList> minor = GallListDao.getInstance().selectAll(1);
						for (int i = 0; i < minor.size(); i++) {
							%>
							<li>
								<a href="gallMain.jsp?idx=<%= minor.get(i).getIdx() %>">
									<span><%= i+1 %></span>
									<span><%=minor.get(i).getName() %></span>
								</a>
							</li>
							<%
						}
					%>
					</ol>
					<ol id=mini style=display:none>
					<%
						List<GallList> mini = GallListDao.getInstance().selectAll(2);
						for (int i = 0; i < minor.size(); i++) {
							%>
							<li>
								<a href="gallMain.jsp?idx=<%= mini.get(i).getIdx() %>">
									<span><%= i+1 %></span>
									<span><%=mini.get(i).getName() %></span>
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
<script>
	let ran = <%=n%>;
	let main = document.getElementById("main");
	let minor = document.getElementById("minor");
	let mini = document.getElementById("mini");
	let a_main = document.querySelector("#inline a:first-child");
	let a_minor = document.querySelector("#inline a:nth-child(2)");
	let a_mini = document.querySelector("#inline a:last-child");
	
	function change() {
		switch (ran) {
		case 0:
			a_main.classList.add("on");
			a_minor.classList.remove("on");
			a_mini.classList.remove("on");
			main.style.display = 'block';
			minor.style.display = 'none';
			mini.style.display = 'none';
			break;
		case 1:
			a_minor.classList.add("on");
			a_main.classList.remove("on");
			a_mini.classList.remove("on");
			main.style.display = 'none';
			minor.style.display = 'block';
			mini.style.display = 'none';
			break;
		case 2:
			a_mini.classList.add("on");
			a_main.classList.remove("on");
			a_minor.classList.remove("on");
			main.style.display = 'none';
			minor.style.display = 'none';
			mini.style.display = 'block';
			break;

		default:
			break;
		}
	}
	
	change();

	function f_main() {
		ran = 0;
		change();
	}
	
	function f_minor() {
		ran = 1;
		change();
	}
	
	function f_mini() {		
		ran = 2;
		change();
	}
</script>
<style>
	.on {text-decoration: underline;}
</style>
</html>