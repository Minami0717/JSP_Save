<%@page import="gall.UserDao"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="gall.ReplyDao"%>
<%@page import="gall.Reply"%>
<%@page import="gall.PostDao"%>
<%@page import="gall.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	Integer p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String name = GallListDao.getInstance().selectOne(idx).getName();
	String p = request.getParameter("post");

	Post post = PostDao.getInstance().select(p_idx);
	post.setHits(post.getHits()+1);
	PostDao.getInstance().update(post);
	
	List<Post> list = PostDao.getInstance().selectAll(idx);
	List<Post> recoList = PostDao.getInstance().selectReco(idx);
	List<Reply> replies = ReplyDao.getInstance().selectAll(p_idx);
	
	Boolean isFixed = UserDao.getInstance().isFixed(post.getMember_id());
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 a {color: #d2af8a}
	main {
		width: 950px;
		margin: 0 auto;
	}
	
	#header {padding: 20px 0;}
	#post {width: 100%; height: 500px;
	border-top: 2px solid #d2af8a; position: relative;}
	
	#head {border-bottom: 1px solid gainsboro; padding: 15px 10px 15px 5px;}
	#head .right {font-size: 13px;}
	
	p a[href="#reply"] {padding: 2px 10px; background: #eee; border: 1px #ccc solid; border-radius: 50px;}
	p a[href="#reply"]:hover {text-decoration: none;}
	
	#sub {font-size: 13px; display: inline-block;}
	#con {padding: 10px;}

	a {text-decoration: none; color: black;}
	
	#rec {border: 1px solid gainsboro; width: 300px; height: 100px; text-align: center; position: absolute; bottom: 50px; left: 35%;}
	#rec img {width: 25px;}
	#rec button {margin-top: 20px; border-radius: 100px; width: 55px; height: 55px; border: none; color: white; cursor: pointer;}
	#rec p { font-size: 12px;}
	#rec button:nth-of-type(2) {background: #b2b4b2;}
	#rec span {font-weight: bold; margin: 25px;}
	#rec span:first-of-type {color: #d31900;}
	#rec span:last-of-type {color: #555;}
	
	#text {padding: 10px; border-top: 2px solid #d2af8a; background: #fafafa; clear: both;}
	#text div:last-child {clear: both;}
	#text input[type=text], #text input[type=password] {height: 30px; border: 1px solid gainsboro; padding: 0 5px; margin-bottom: 5px;}
	
	input[type=submit] {background: #d2af8a; color: white; width: 85px; height: 30px; border: none; cursor: pointer; border-radius: 2px; margin-top: 10px;}
	input[readonly] {background: #f3f3f3; color: #999; outline: none; cursor: default;}
	
	#np {display: inline-block;}
	#np input {width: 140px;}
	
	.left {text-align: left;}
	#reply {border-bottom: 2px solid #d2af8a;}
	
	#ta {float: right;}
	textarea {width: 740px; height: 78px; border: 1px solid gainsboro; resize: none; padding: 13px; font-size: 13px; line-height: 18px;}
	#nick {width: 150px;}
	
	main button {width: 82px; height: 35px; background: #d2af8a; color: white;
	border: 1px solid #d2af8a; border-bottom-width: 3px; margin-top: 10px;
	margin-bottom: 40px; font-weight: bold; border-radius: 2px;
	cursor: pointer;}
	
	#ns {background: white; color: #d2af8a;}
	#edit,#delete {background: #b2b4b2; border-color: #a0a2a0;}
	#delete {margin: 10px;}
	#del {border: none; background: #c6c8c9; width: 15px; height: 15px; margin: 0;}
	#del img {width: 10px;}
	
	#tiv {margin-bottom: 30px; clear: both; border-top: 2px solid #d2af8a;}
	#tiv li {list-style-type: none; border-bottom: 1px solid gainsboro; padding: 10px;}
	#tiv span {display: inline-block;}
	#tiv span:first-child {width: 160px; font-size: 13px; color: #777;}
	#tiv span:nth-child(2) {width: 660px;}
	#tiv span:nth-child(3) {font-size: 12px; color: #999;}
	#tiv div:last-of-type {margin: 20px 0;}
	
	#left span {color: #d31900;}
	.reTop,.reBot {font-size: 13px; margin-bottom: 10px;}
	
	.right {float: right;}
	.right img {height: 10px;}
	.right a:hover {text-decoration: none;}
	.right button {background: none; color: black; border: none; margin: 0; height: auto; width: auto;}
	
	#left {float: left; font-weight: bold;}
	#delCheck {position: absolute; width: 218px; height: 31px;
    border: 2px solid #d2af8a; display: none;}
    #pc {width: 129px; height: 31px; margin: 0; padding: 0;}
    #check {width: 49px; height: 31px;}
    #x {width: 30px; height: 31px;}
    #ip {color: #999;}
    #w {cursor: pointer;}
    
	#bot {width: 70%; float: left;}
    #bot table {width: 100%; text-align: center; border-bottom: 1px solid #d2af8a; border-spacing: 0; font-size: 13px;
	border-collapse: collapse;}
	#bot th {border-bottom: 1px solid #d2af8a; border-top: 2px solid #d2af8a; height: 37px;}
	#bot td {height: 25px; vertical-align: middle; border-top: 1px solid gainsboro;}
	#bot table img {height: 13px; margin-right: 10px;}
	#bot table span {font-size: 11px; color: #999;}
	#bot td[align=left] a:last-of-type {color: #999;}
    
    #login {border: 1px solid #d2af8a; float: right; width: 270px;}
	#login img {height: 13px;}
	#login p {padding: 10px 20px;}
	#login p a {color: #d2af8a; font-weight: bold; font-size: 14px;}
	#login p a:hover {text-decoration: none;}
	#login div {background: #f3f3f3; padding: 10px; text-align: center;}
	#login div a {font-size: 12px; font-weight: bold;}
	#login button {width: 65px; height: 25px; background: #d2af8a; color: white; border: none; border: 1px solid #d2af8a;
	margin-left: 10px; cursor: pointer; font-weight: bold; float: right; margin: 0;}
	
	.click {cursor: pointer;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {
	    $(".reTop button").on("click", function() {
	    	$("#tiv").toggle();
	    	
	        if ($(".reTop button b").text() == "댓글닫기") {
	        	$(".reTop button b").text("댓글열기")
		        $(".reTop button img").attr("src","image/down.png")
	        }
	        else {
	        	$(".reTop button b").text("댓글닫기")
		        $(".reTop button img").attr("src","image/arrow-up.png")
	        }
	    });
	    
	    $(".reBot button").on("click", function() {
	    	$("#tiv").toggle();
	    	
	    	if ($(".reTop button b").text() == "댓글닫기") {
	        	$(".reTop button b").text("댓글열기")
		        $(".reTop button img").attr("src","image/down.png")
	        }
	    });
	});
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<main>
		<div id=header>
			<h2><a href=gallMain.jsp?idx=<%=idx%>><%=name %></a></h2>
		</div>
		<div id=post>
			<div id=head>
				<b><%=post.getTitle() %></b><br>
				<p id=sub><span class=click><%=post.getWriter() %></span>
				<%
					if(post.getMember_id() == null) {
						String ipAddress = request.getRemoteAddr();
						if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
						    InetAddress inetAddress = InetAddress.getLocalHost();
						    ipAddress = inetAddress.getHostAddress();
						}
						%><span id=ip class=click>(<%=ipAddress.substring(0,7)%>)</span><%
					}
					else if(isFixed) {%><a href=#><img src=image/fix_nik.gif></a><%}
					else if(!isFixed) {%><a href=#><img src=image/nik.gif></a><%}
				%>
				&nbsp;&nbsp;|&nbsp;&nbsp;<%=post.getDate() %></p>
				<p class="right">
					조회 <%=post.getHits() %> |
					추천 <%=post.getRecommend() %> |
					<a href=#reply>댓글 <%=post.getReplyNum() %></a>
				</p>
			</div>
			<div id=con><%=post.getContent() %></div>
			<div id=rec>
				<span><%=post.getRecommend() %></span>
				<%
					if(post.getRecommend() >= 10) {
						%>
						<button onclick="location.href='reco.jsp?reco=re&idx=<%= idx %>&p_idx=<%=p_idx %>'">
							<img src=image/star3.png><p>추천
						</button>
						<%
					}
					else {
						%>
						<button onclick="location.href='reco.jsp?reco=re&idx=<%= idx %>&p_idx=<%=p_idx %>'">
							<img src=image/star2.png><p>추천
						</button>
						<%
					}
				%>
				<button onclick="location.href='reco.jsp?reco=de&idx=<%= idx %>&p_idx=<%=p_idx %>'">
					<img src=image/down-arrow.png><p>비추
				</button>
				<span><%=post.getDecommend() %></span>
			</div>
		</div>
		<div id=reply>
			<div class="reTop" id=left>
				전체 댓글 <span><%=post.getReplyNum() %></span>개
				<select>
					<option>등록순
					<option>최신순
					<option>답글순
				</select>
			</div>
			<div class="reTop right">
				<a href=#header><b>본문 보기</b></a> &nbsp;|&nbsp;
				<button><b>댓글닫기</b> <img src=image/arrow-up.png></button> &nbsp;|&nbsp;
				<a href=#reply><b>새로고침</b></a>
			</div>
			<%
				if (!replies.isEmpty()) {
					%>
					<div id=tiv>
						<ul>
					<%
						for (Reply r : replies) {
							if (r.getPost_idx() == p_idx) {
								%>
								<li>
									<span><%=r.getNickname() %></span>
									<span><%=r.getContents() %></span>
									<span><%=r.getDate() %></span>
									<%
										if (session.getAttribute("nick") != null && session.getAttribute("nick").equals(r.getNickname())) {
											%><button id=del><img src=image/close.png></button><%
										}
									%>
								</li>
								<%
							}
						}
					%>
						</ul>
						<div id=delCheck>
							<input id=pc type=password placeholder=비밀번호>
							<button id=check>확인</button><button id=x>X</button>
						</div>
						<div class="reBot right">
							<a href=#header><b>본문 보기</b></a> &nbsp;|&nbsp;
							<button><b>댓글닫기</b> <img src=image/arrow-up.png></button> &nbsp;|&nbsp;
							<a href=#reply><b>새로고침</b></a>
						</div>
					</div>
					<%
				}
			%>
			<div id=text>
				<form action="addReply.jsp" method=post>
					<div id=np>
						<input type="hidden" name=p_idx value=<%=p_idx%>>
						<input type="hidden" name=idx value=<%=idx%>>
						<%
							if (session.getAttribute("nick") == null) {
							%>
								<input type=text placeholder=닉네임 name=nickname><br>
								<input type=password placeholder=비밀번호 name=pw>
							<%
							}
							else {
							%>
								<input type=text placeholder=닉네임 name=nickname value=<%=session.getAttribute("nick") %> readonly><br>
								<input type=hidden name=pw value=<%=session.getAttribute("pw") %>>
							<%
							}
						%>
					</div>
					<div id=ta>
						<textarea name=reply></textarea>
					</div>
					<div align=right><input type=submit value=등록></div>
				</form>
			</div>
		</div>
		<div>
			<%
				if (p == null) {
					%>
					<button onclick="location.href='gallMain.jsp?idx=<%=idx%>'">전체글</button>
					<button id=ns onclick="location.href='gallMain.jsp?idx=<%=idx%>&post=reco'">추천글</button>
					<%
				}
				else if (p.equals("reco")) {
					%>
					<button id=ns onclick="location.href='gallMain.jsp?idx=<%=idx%>'">전체글</button>
					<button onclick="location.href='gallMain.jsp?idx=<%=idx%>&post=reco'">추천글</button>
					<%
				}
			%>
			<button class=right onclick="location.href='write.jsp?idx=<%=idx%>'">글쓰기</button>
		<%
			if(post.getMember_id() == null) {
				%>
				<button class=right id=delete onclick="location.href='pwCheckForm.jsp?idx=<%=idx%>&p_idx=<%= p_idx %>&type=del'">삭제</button>
				<button class=right id=edit onclick="location.href='pwCheckForm.jsp?idx=<%=idx%>&p_idx=<%= p_idx %>&type=mod'">수정</button>
				<%
			}
			else if(post.getMember_id().equals(session.getAttribute("code"))) {
				%>
				<button class=right id=delete onclick="location.href='delCheckForm.jsp?idx=<%=idx%>&p_idx=<%= p_idx %>'">삭제</button>
				<button class=right id=edit onclick="location.href='modifyForm.jsp?idx=<%=idx%>&p_idx=<%= p_idx %>'">수정</button>
				<%
			}
		%>
		</div>
		<div id=bot>
			<table>
				<thead>
					<tr>
						<th width=50px>번호
						<th>제목
						<th width=100px>글쓴이
						<th width=80px>작성일
						<th width=50px>조회
						<th width=50px>추천
					</tr>
				</thead>
				<tbody>
				<%
					if (p == null) {
						for(int i = list.size()-1; i >= 0; i--) {
							isFixed = UserDao.getInstance().isFixed(list.get(i).getMember_id());
							String date;
							if (!list.get(i).getDate().substring(0,4).equals(String.valueOf(LocalDate.now().getYear())))
								date = list.get(i).getDate().substring(2,4)+"."+list.get(i).getDate().substring(5,7)+"."
									+list.get(i).getDate().substring(8,10);
							else if (!list.get(i).getDate().substring(0,10).equals(LocalDate.now().toString()))
								date = list.get(i).getDate().substring(5,7)+"."+list.get(i).getDate().substring(8,10);
							else
								date = list.get(i).getDate().substring(11,16);
							%><tr>
								<td><%=i+1 %>
								<td align=left>
									<a href="result.jsp?idx=<%= idx %>&p_idx=<%=list.get(i).getIdx() %>">
									<img src=image/chat.png><%=list.get(i).getTitle() %></a>
									<a href="result.jsp?idx=<%= idx %>&p_idx=<%=list.get(i).getIdx() %>#reply">[<%=list.get(i).getReplyNum() %>]</a>
								<td id=w><%=list.get(i).getWriter() %>
									<%
										if(list.get(i).getMember_id() == null) {
											String ipAddress = request.getRemoteAddr();
											if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
											    InetAddress inetAddress = InetAddress.getLocalHost();
											    ipAddress = inetAddress.getHostAddress();
											}
											%><span>(<%=ipAddress.substring(0,7)%>)</span><%
										}
										else if(isFixed) {%><a href=#><img src=image/fix_nik.gif></a><%}
										else if(!isFixed) {%><a href=#><img src=image/nik.gif></a><%}
									%>
								<td><%=date %>
								<td><%=list.get(i).getHits() %>
								<td><%=list.get(i).getRecommend() %><%
						}
					}
					else if (p.equals("reco")) {
						for(int i = recoList.size()-1; i >= 0; i--) {
							isFixed = UserDao.getInstance().isFixed(recoList.get(i).getMember_id());
							String date;
							if (!recoList.get(i).getDate().substring(0,4).equals(String.valueOf(LocalDate.now().getYear())))
								date = recoList.get(i).getDate().substring(2,4)+"."+recoList.get(i).getDate().substring(5,7)+"."
									+recoList.get(i).getDate().substring(8,10);
							else if (!recoList.get(i).getDate().substring(0,10).equals(LocalDate.now().toString()))
								date = recoList.get(i).getDate().substring(5,7)+"."+recoList.get(i).getDate().substring(8,10);
							else
								date = recoList.get(i).getDate().substring(11,16);
							%><tr>
								<td><%=i+1 %>
								<td align=left>
									<a href="result.jsp?idx=<%= idx %>&p_idx=<%=recoList.get(i).getIdx() %>">
									<img src=image/chat.png> <%=recoList.get(i).getTitle() %></a>
									<a href="result.jsp?idx=<%= idx %>&p_idx=<%=recoList.get(i).getIdx() %>#reply">[<%=recoList.get(i).getReplyNum() %>]</a>
								<td id=w><%=recoList.get(i).getWriter() %>
									<%
									if(recoList.get(i).getMember_id() == null) {
										String ipAddress = request.getRemoteAddr();
										if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
										    InetAddress inetAddress = InetAddress.getLocalHost();
										    ipAddress = inetAddress.getHostAddress();
										}
										%><span>(<%=ipAddress.substring(0,7)%>)</span><%
									}
									else if(isFixed) {%><img src=image/fix_nik.gif><%}
									else if(!isFixed) {%><img src=image/nik.gif><%}
									%>
								<td><%=date %>
								<td><%=recoList.get(i).getHits() %>
								<td><%=recoList.get(i).getRecommend() %><%
						}
					}
				%>
				</tbody>
			</table>
			<div>
				<%
					if (p == null) {
						%>
						<button onclick="location.href='gallMain.jsp?idx=<%=idx%>'">전체글</button>
						<button id=ns onclick="location.href='gallMain.jsp?idx=<%=idx%>&post=reco'">추천글</button>
						<%
					}
					else if (p.equals("reco")) {
						%>
						<button id=ns onclick="location.href='gallMain.jsp?idx=<%=idx%>'">전체글</button>
						<button onclick="location.href='gallMain.jsp?idx=<%=idx%>&post=reco'">추천글</button>
						<%
					}
				%>
				<button class=right onclick="location.href='write.jsp?idx=<%=idx%>'">글쓰기</button>
			</div>
		</div>
		<div id=login>
			<%
				if (session.getAttribute("code") == null) {
					%>
					<p><a href=loginForm.jsp?idx=<%= idx %>>로그인해 주세요.</a>
					<div>
						<a href=#>MY블로그</a> &nbsp;|&nbsp;
						<a href=#>즐겨찾기</a> &nbsp;|&nbsp;
						<a href=#><img src=image/bell.png> 알림</a>
					</div>
					<%
				}
				else {
					%>
					<p><a href=#><b><%=session.getAttribute("nick") %></b>님<img src=image/right-arrow3.png></a>
					<button onclick="location.href='logout.jsp?where=gall&idx=<%=idx%>'">로그아웃</button>
					<div>
						<a href=#>MY블로그</a> |
						<a href=#>즐겨찾기</a> |
						<a href=#>운영/가입</a> |
						<a href=#><img src=image/bell.png> 알림</a>
					</div>
					<%
				}
			%>
		</div>
	</main>
</body>
</html>