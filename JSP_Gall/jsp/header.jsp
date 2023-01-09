<%@page import="gall.GallListDao"%>
<%@page import="gall.GallList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<GallList> gList = GallListDao.getInstance().selectAll();
%>
<style>
	* {margin: 0; padding: 0;}
	a {text-decoration: none; color: black;}
	a:not(h1 a,h4 a,h5 a,h2 a):hover {text-decoration: underline;}
	
	header {margin-top: 30px;}
	
	h1 {display: inline-block; margin-left: 25%; margin-right: 5%;}
	
	nav {background: #3b4890; width: 100%; padding: 10px; margin-top: 20px;}
	nav ul {margin-left: 25%;}
	nav li {display: inline-block; margin-right: 15px; font-weight: bold;}
	nav a {color: white;}
	
	#search input {width: 315px; height: 35px; float: left;}
	#search button {width: 40px; height: 40px; background: url(image/search.PNG); border: none; background-size: cover;}
	#search {display: inline-block; border: 4px solid #3b4890; height: 39px;}

	#visit {margin-left: 25%; margin-right: 25%; border: 1px solid gainsboro; padding: 10px; font-size: 12px; color: #3b4890; font-weight: bold; background-color: rgb(240, 240, 240);}
    #visit img {height: 8px; cursor: pointer;}
    #visit button {background-color: white; padding: 0 4px; border: 1px solid gainsboro; margin: 0 5px; cursor: pointer;}
    #visit li,#visit ul {display: inline;}
    #visit a {color: black; font-weight: normal;}
    #visit ul img {margin: 0 15px; height: 7px; cursor: pointer;}
    #visit ul {margin-left: 5px;}
    
    .right {float: right;}
	.left {float: left;}
</style>
<header>
	<h1><a href=main.jsp>minami.com</a></h1>
	<div id=search>
		<input type=text placeholder=" 갤러리 & 통합검색">
		<button></button>
	</div>
	<nav>
		<ul>
			<li><a href=#>갤러리</a>
			<li><a href=#>마이너갤</a>
			<li><a href=#>미니갤</a>
			<li>|
			<li><a href=#>갤로그</a>
			<li><a href=#>뉴스</a>
			<li><a href=#>게임</a>
			<li><a href=#>위키</a>
			<li><a href=#>이벤트</a>
			<li><a href=#>이모티콘</a>
		</ul>
	</nav>
	<div id=visit>
		최근 방문
        <button><img src="image/drop-down-arrow.png"></button>
        <img src="image/left.png">
        <ul>
        <%
        	for (GallList g : gList) {
        		%><li><a href="gallMain.jsp?gallName=<%= g.getName() %>"><%= g.getName() %></a><img src="image/x1.png"></li><%
        	}
        %>
        </ul>
        <div class="right"><img src="image/right-arrow.png"><a href="#">전체</a></div>
	 </div>
</header>