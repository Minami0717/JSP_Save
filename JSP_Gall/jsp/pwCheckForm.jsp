<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	Integer p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String name = GallListDao.getInstance().selectGallName(idx);
	String type = request.getParameter("type");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 a {color: #d2af8a;}
	section {margin: 0 25%;}
	
	form {border: 3px solid #d2af8a; margin: 100px 300px; text-align: center; padding: 50px;}
	form b {display: block; color: #d2af8a;}
	form input[name=pw] {width: 164px; height: 37px; padding: 0 5px; margin-top: 14px; background: #f3f3f3; border: 1px solid #cecdce;}
	form button, form input[type=submit] {width: 85px; height: 31px; color: #fff; border: none; border-radius: 2px; font-size: 12px; font-weight: bold; cursor: pointer;}
	form div {padding: 15px 0 0;}
	form button {background: #b2b4b2;}
	form input[type=submit] {background: #d2af8a;}
	
	#header {padding: 20px 0; border-bottom: 2px solid #d2af8a;}
</style>
<script>
	function check() {
		if(inputPw.pw.value == "") {
			alert("비밀번호를 입력하세요.")
			inputPw.pw.focus()
			return
		}
		
		if(confirm("게시글을 삭제하면 복구할 수 없습니다.\n정말 삭제하시겠습니까?"))
			location.href = "delPost.jsp?idx=<%=idx%>&p_idx=<%=p_idx%>"
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div id=header>
			<h2><a href=gallMain.jsp?idx=<%=idx%>><%=name %></a></h2>
		</div>
		<form name=inputPw action="pwCheck.jsp?idx=<%= idx %>&p_idx=<%= p_idx %>&type=<%=type %>" method="post">
			<b>비밀번호를 입력하세요.</b>
			<input type=password name=pw>
			<div>
				<button type=button onclick=history.back()>취소</button>
				<input type=submit value=확인>
			</div>
		</form>
	</section>
</body>
</html>