<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="friend.PostDao"%>
<%@page import="friend.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	List<Post> list = PostDao.getInstance().selectAll();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {width: 100%; text-align: center;}
	th {border-bottom: 1px solid #3b4890; border-top: 2px solid #3b4890;}
	td {border-bottom: 1px solid gainsboro;}
	a {text-decoration: none; color: black;}
</style>
</head>
<body>
	<table>
		<tr>
			<th width=50px>번호
			<th>제목
			<th width=50px>글쓴이
			<th width=100px>작성일
			<th width=50px>조회
			<th width=50px>추천
		</tr>
	<%
		for(Post post : list) {
			String date;
			if (!post.getDate().substring(0,10).equals(LocalDate.now().toString()))
				date = post.getDate().substring(5,10);
			else
				date = post.getDate().substring(11,16);
			
			%><tr>
				<td><%=post.getIdx() %>
				<td><a href="result.jsp?idx=<%=post.getIdx() %>"><%=post.getTitle() %></a>
				<td><%=post.getWriter() %>
				<td><%=date %>
				<td><%=post.getHits() %>
				<td><%=post.getRecommend() %><%
		}
	%>
	</table>
	<input type=button value=글쓰기 onclick="location.href='write.jsp'">
	<input type=button value=로그아웃 onclick="location.href='loginForm.jsp'">
	<input type=button value=회원정보수정 onclick="location.href='updateForm.jsp'">
	<input type=button value=회원탈퇴 onclick=del()>
</body>
<script>
	function del() {
		if (confirm("정말로 탈퇴하시겠습니까?"))
			location.href="delete.jsp";
		else
			return;
	}
</script>
</html>