<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="gall.PostDao"%>
<%@page import="gall.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	if (request.getParameter("nick").isEmpty()) {
		%><script>alert("닉네임을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if (request.getParameter("pw").isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if (request.getParameter("title").isEmpty()) {
		%><script>alert("제목을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if (request.getParameter("content").isEmpty()) {
		%><script>alert("내용을 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	String writer = request.getParameter("nick");
	String pw = request.getParameter("pw");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String date = LocalDateTime.now().format(
			DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	
	Post post = new Post();
	post.setTitle(title);
	post.setContent(content);
	post.setWriter(writer);
	post.setDate(date);
	post.setPw(pw);
	
	int result = PostDao.getInstance().insert(post);
	if (result != 0)
		response.sendRedirect("loginSucc.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>