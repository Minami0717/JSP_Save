<%@page import="gall.PostDao"%>
<%@page import="gall.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	
	Post post = PostDao.getInstance().select(p_idx);
	String name = GallListDao.getInstance().selectOne(idx).getName();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* body {width: 60%;  margin-left: 20%;} */
	h2 a {color: #d2af8a}
	section {margin: 0 25%;}
	#outside {border: 2px solid #d5d5d5; height: 600px; border-top-color: #d2af8a;
	padding: 33px 68px 5px;}
	
	input[name=nick],input[name=pw] {width: 200px; line-height: 35px; border: 1px solid #b2b4b2; padding: 0 10px;}
	input[name=title] {width: 700px; height: 35px; margin: 10px 0 20px; border: 1px solid #b2b4b2; padding: 0 10px;}
	input[type=submit],#outside button {float: right; width: 85px; height: 40px;
	background: #d2af8a; color: white; border: 1px solid #d2af8a;
	border-bottom-width: 3px; margin-top: 10px; font-weight: bold;
	border-radius: 2px; cursor: pointer; margin-left: 10px;}
	
	textarea {border: 1px solid #b2b4b2; padding: 10px; width: 800px; height: 400px; outline: none; font-size: 15px;}
	
	#outside button {background: #b2b4b2; border-color: #a0a2a0;}
	#header {padding: 20px 0;}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div id=header>
			<h2><a href=gallMain.jsp?idx=<%=idx%>><%=name %></a></h2>
		</div>
		<div id=outside>
			<form action="modify.jsp?idx=<%=idx%>&p_idx=<%=p_idx %>" method=post>
				<div>
					<%
						if(session.getAttribute("code") == null) {
							%>
							<input type=text placeholder=닉네임 name=nick value=<%=post.getWriter() %> readonly>
							<input type=password placeholder=비밀번호 name=pw value=<%=post.getPw() %> readonly>
							<%
						}
						else {
							%>
							<input type=hidden value=<%=post.getWriter() %> name=nick>
							<input type=hidden value=<%=post.getPw() %> name=pw>
							<%
						}
					%>
				</div>
				<div><input type=text placeholder="제목을 입력해 주세요." name=title value=<%=post.getTitle() %>></div>
				<textarea name=content><%=post.getContent() %></textarea><br>
				<input type=submit value=등록>
			</form>
			<button onclick=history.back()>취소</button>
		</div>
	</section>
</body>
</html>