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
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String writer = request.getParameter("nick");
	String pw = request.getParameter("pw");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Post post = new Post();
	post.setTitle(title);
	post.setContent(content);
	post.setWriter(writer);
	post.setPw(pw);
	post.setIdx(p_idx);
	
	int result = PostDao.getInstance().modify(post);
	if (result != 0)
		response.sendRedirect("gallMain.jsp?idx="+idx);
%>