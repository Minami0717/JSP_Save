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
	String name = GallListDao.getInstance().selectGallName(idx);

	Post post = PostDao.getInstance().select(p_idx);
	post.setHits(post.getHits()+1);
	PostDao.getInstance().update(post);
	
	List<Post> list = PostDao.getInstance().selectAll(idx);
	List<Reply> replies = ReplyDao.getInstance().selectAll(p_idx);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 a {color: #d2af8a}
	section {margin: 0 25%;}
	#header {padding: 20px 0;}
	#post {width: 100%; height: 500px;
	border-top: 2px solid #d2af8a; position: relative;}
	
	#head {border-bottom: 1px solid gainsboro; padding: 15px 10px 15px 5px;}
	#head .right {font-size: 13px;}
	a[href="#reply"] {padding: 2px 10px; background: #eee; border: 1px #ccc solid; border-radius: 50px;}
	a[href="#reply"]:hover {text-decoration: none;}
	#sub {font-size: 13px; display: inline-block;}
	#con {padding: 10px;}

	a {text-decoration: none; color: black;}
	
	#rec {border: 1px solid gainsboro; width: 300px;
	height: 100px; text-align: center; position: absolute;
	bottom: 50px; left: 35%;}
	#rec img {width: 25px;}
	#rec button {margin-top: 20px; border-radius: 100px; width: 55px; height: 55px; border: none; color: white; cursor: pointer;}
	#rec p { font-size: 12px;}
	#rec button:last-child {background: #b2b4b2;}
	
	#text input[type=text],input[type=password] {height: 30px; border: 1px solid gainsboro; padding: 0 5px;}
	
	input[type=submit] {background: #d2af8a; color: white; width: 85px; height: 30px;
	border: none; cursor: pointer; border-radius: 2px; margin-top: 10px;}
	input[readonly] {background: #f3f3f3; color: #999;}
	
	#np {display: inline-block;}
	#np input {width: 140px;}
	
	.left {text-align: left;}
	#reply {border-bottom: 2px solid #d2af8a;}
	#text {padding: 10px; border-top: 2px solid #d2af8a; background: #fafafa; clear: both;}
	#text div:last-child {clear: both;}
	#ta {float: right;}
	textarea {width: 770px; height: 100px; border: 1px solid gainsboro;}
	#nick {width: 150px;}
	section button {width: 82px; height: 35px; background: #d2af8a; color: white;
	border: 1px solid #d2af8a; border-bottom-width: 3px; margin-top: 10px;
	margin-bottom: 40px; font-weight: bold; border-radius: 2px;
	cursor: pointer;}
	#idea {margin-left: 10px; background: white; color: #d2af8a;}
	.right {float: right;}
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
	
	#left span {color: #d31900;}
	.reTop {font-size: 14px; font-weight: bold; margin-bottom: 10px;}
	#right {float: right;}
	#left {float: left;}
	#delCheck {position: absolute; width: 218px; height: 31px;
    border: 2px solid #d2af8a; display: none;}
    #pc {width: 129px; height: 31px; margin: 0; padding: 0;}
    #check {width: 49px; height: 31px;}
    #x {width: 30px; height: 31px;}
    
	#bot {width: 70%; float: left;}
    #bot table {width: 100%; text-align: center; border-bottom: 1px solid #d2af8a; border-spacing: 0; font-size: 13px;
	border-collapse: collapse;}
	#bot th {border-bottom: 1px solid #d2af8a; border-top: 2px solid #d2af8a; height: 37px;}
	#bot td {height: 25px; vertical-align: middle; border-top: 1px solid gainsboro;}
    
    #login {border: 1px solid #d2af8a; float: right; width: 270px;}
	#login img {height: 13px;}
	#login p {padding: 10px 20px;}
	#login p a {color: #d2af8a; font-weight: bold; font-size: 14px;}
	#login p a:hover {text-decoration: none;}
	#login div {background: #f3f3f3; padding: 10px; text-align: center;}
	#login div a {font-size: 12px; font-weight: bold;}
	#login button {width: 65px; height: 25px; background: #d2af8a; color: white; border: none; border: 1px solid #d2af8a;
	margin-left: 10px; cursor: pointer; font-weight: bold; float: right; margin: 0;}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div id=header>
			<h2><a href=gallMain.jsp?idx=<%=idx%>><%=name %></a></h2>
		</div>
		<div id=post>
			<div id=head>
				<b><%=post.getTitle() %></b><br>
				<p id=sub><a href=#><%=post.getWriter() %></a>&nbsp;&nbsp;|&nbsp;&nbsp;<%=post.getDate() %></p>
				<p class="right">
					조회 <%=post.getHits() %> |
					추천 <%=post.getRecommend() %> |
					<a href=#reply>댓글 <%=post.getReplyNum() %></a>
				</p>
			</div>
			<div id=con><%=post.getContent() %></div>
			<div id=rec>
				<%=post.getRecommend() %>
				<button onclick="location.href='reco.jsp?reco=re&idx=<%= idx %>&p_idx=<%=p_idx %>'">
					<img src=image/star2.png><p>추천
				</button>
				<button onclick="location.href='reco.jsp?reco=de&idx=<%= idx %>&p_idx=<%=p_idx %>'">
					<img src=image/down-arrow.png><p>비추
				</button>
				<%=post.getDecommend() %>
			</div>
		</div>
		<div id=reply>
			<div class=reTop id=left>
				전체 댓글 <span><%=post.getReplyNum() %></span>개
				<select>
					<option>등록순
					<option>최신순
					<option>답글순
				</select>
			</div>
			<div class=reTop id=right>본문 보기 | 댓글 닫기 | 새로고침</div>
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
			<button onclick="location.href='gallMain.jsp?idx=<%= idx %>'">전체글</button>
			<button id=idea onclick="location.href='gallMain.jsp?idx=<%=idx%>&post=reco'">개념글</button>
			<button class=right onclick="location.href='write.jsp'">글쓰기</button>
		<%
			if(post.getWriter().equals(session.getAttribute("nick")) || !post.isMember()) {
				%>
				<button class=right id=delete>삭제</button>
				<button class=right id=edit>수정</button>
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
						<th width=50px>글쓴이
						<th width=100px>작성일
						<th width=50px>조회
						<th width=50px>추천
					</tr>
				</thead>
				<tbody>
				<%
					for(int i = list.size()-1; i >= 0; i--) {
						String date;
						if (!list.get(i).getDate().substring(0,4).equals(String.valueOf(LocalDate.now().getYear())))
							date = list.get(i).getDate().substring(2,4)+"."+list.get(i).getDate().substring(5,7)+"."
								+list.get(i).getDate().substring(8,10);
						else if (!list.get(i).getDate().substring(0,10).equals(LocalDate.now().toString()))
							date = list.get(i).getDate().substring(5,7)+"."+list.get(i).getDate().substring(8,10);
						else
							date = list.get(i).getDate().substring(11,16);
						%><tr>
							<td><%=list.get(i).getIdx() %>
							<td align=left><a href="result.jsp?idx=<%= idx %>&p_idx=<%=list.get(i).getIdx() %>"><%=list.get(i).getTitle() %></a>
							<td><%=list.get(i).getWriter() %>
							<td><%=date %>
							<td><%=list.get(i).getHits() %>
							<td><%=list.get(i).getRecommend() %><%
					}
				%>
				</tbody>
			</table>
			<div>
				<button onclick="location.href='gallMain.jsp?idx=<%=idx%>'">전체글</button>
				<button id=idea onclick="location.href='gallMain.jsp?idx=<%=idx%>&post=reco'">개념글</button>
			</div>
		</div>
		<div id=login>
			<%
				if (session.getAttribute("code") == null) {
					%>
					<p><a href=loginForm.jsp?idx=<%= idx %>>로그인해 주세요.</a>
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
					<button onclick="location.href='logout.jsp?where=gall&idx=<%=idx%>'">로그아웃</button>
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
</body>
</html>