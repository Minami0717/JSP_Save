<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>Minami Mall</h1></div>
	<div class=center>
		현재 접속 시각 : <%=LocalTime.now().format(
				DateTimeFormatter.ofPattern("hh:mm:ss")) %>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>