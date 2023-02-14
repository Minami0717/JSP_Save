<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	Integer p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String name = GallListDao.getInstance().selectOne(idx).getName();
	String type = request.getParameter("type");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 a {color: #d2af8a;}
	section {margin: 0 25%;}
	section > div:last-child {border: 3px solid #d2af8a; margin: 100px 300px; text-align: center; padding: 50px;}
	
	section > div:last-child b {display: block; color: #d2af8a; font-size: 14px;}
	section > div:last-child button {width: 85px; height: 31px; color: #fff; border: none; border-radius: 2px; font-size: 12px; font-weight: bold; cursor: pointer;}
	section > div:last-child div {padding: 15px 0 0;}
	section button:first-of-type {background: #b2b4b2;}
	section button:last-of-type {background: #d2af8a;}
	
	#header {padding: 20px 0; border-bottom: 2px solid #d2af8a;}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div id=header>
			<h2><a href=gallMain.jsp?idx=<%=idx%>><%=name %></a></h2>
		</div>
		<div>
			<b>삭제된 게시물은 복구할 수 없습니다.</b><br><b>게시물을 삭제하시겠습니까?</b>
			<div>
				<button onclick=history.back()>이전</button>
				<button onclick="location.href='delPost.jsp?idx=<%= idx %>&p_idx=<%=p_idx%>'">삭제</button>
			</div>
		</div>
	</section>
</body>
</html>