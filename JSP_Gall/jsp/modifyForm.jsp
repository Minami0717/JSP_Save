<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	String name = GallListDao.getInstance().selectGallName(idx);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 a {color: #d2af8a;}
	section {margin: 0 25%;}
	
	form {border: 3px solid #d2af8a; margin: 100px;}
	form b {display: block;}
	
	#header {padding: 20px 0; border-bottom: 2px solid #d2af8a;}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div id=header>
			<h2><a href=gallMain.jsp?idx=<%=idx%>><%=name %></a></h2>
		</div>
		<form action=modify.jsp method="post">
			<b>비밀번호를 입력하세요.</b>
			<input type=password>
		</form>
	</section>
</body>
</html>