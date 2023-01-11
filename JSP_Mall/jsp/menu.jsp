<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	* {margin: 0; padding: 0;}
	a {text-decoration: none; color: white;}
	#menu {background: #b2b4b2; padding: 10px;}
	#menu > a {margin-left: 100px;}
	li {display: inline-block; margin: 0 12px; color: white;}
	ul {float: right; margin-right: 100px;}
</style>
<div id=menu>
	<a href=home.jsp>Home</a>
	<ul>
		<%
			if (session.getAttribute("id") != null) {
				%><li>[<%=session.getAttribute("id") %>님]
				<li><a href=logout.jsp>로그아웃</a>
				<li><a href=memberUpdateForm.jsp>회원정보 수정</a><%
			}
			else {
				%><li><a href=loginForm.jsp>로그인</a>
				<li><a href=joinForm.jsp>회원가입</a><%
			}
		%>
		<li><a href=products.jsp>상품 목록</a>
		<li><a href=addForm.jsp>상품 등록</a>
		<li><a href=updateForm.jsp>상품 수정</a>
		<li><a href=deleteForm.jsp>상품 삭제</a>
		<li><a href=noticeForm.jsp>공지사항</a>
	</ul>
</div>