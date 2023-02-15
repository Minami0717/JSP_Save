<%@page import="gall.Search"%>
<%@page import="java.net.InetAddress"%>
<%@page import="gall.SearchDao"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Stack"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gall.GallListDao"%>
<%@page import="gall.GallList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String word = "";
	if(request.getParameter("word") != null)
		word = request.getParameter("word");
	
	String ip = request.getRemoteAddr();
	if(ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
	    InetAddress inetAddress = InetAddress.getLocalHost();
	    ip = inetAddress.getHostAddress();
	}
	
	ArrayList<String> viList = (ArrayList)session.getAttribute("visitList");
	ArrayList<Search> sList = SearchDao.getInstance().select(ip);
	
	String save = (String)session.getAttribute("save");
	if(save == null)
		save = "on";
%>
<style>
	* {margin: 0; padding: 0;}
	a {text-decoration: none; color: black;}
	a:not(h1 a,h4 a,h5 a,h2 a):hover {text-decoration: underline;}
	
	header {margin-top: 30px;}
	button {cursor: pointer;}
	h1 {display: inline-block; margin-right: 5%;}
	
	nav {background: /* #c9b18c */ #d2af8a; width: 100%; padding: 10px; margin-top: 20px; color: white;}
	nav ul {margin: 0 auto; width: 950px;}
	nav li {display: inline-block; margin-right: 15px; font-weight: bold;}
	nav a {color: white;}
	
	#search {display: inline-block; border: 4px solid #d2af8a; height: 39px; position: relative;}
	#search input[type=text] {width: 315px; height: 35px; float: left; padding: 2px 9px 0; outline: none; border: none; font-weight: bold; color: #333; font-size: 14px;}
	#search input::placeholder {color: #b2b4b2;}
	#search form button {width: 40px; height: 40px; background: #d2af8a; border: none;}
	#search img {width: 25px;}
	#search h5 {background: #f3f3f3; padding: 10px 12px; display: block; color: #d2af8a;}
	#search h5 button {position: absolute; top: 5px; right: 4px; color: #999; text-decoration: underline; border: none; font-size: 12px; padding: 5px;}
	#search > div {left: -4px; position: absolute; border: 2px solid #d2af8a; background: #fff; width: 377px; display: none;}
	#search ul {list-style: none; padding: 8px 0;}
	#search ul img {width: 8px;}
	#search ul a {display: block; color: #555; text-decoration: none; height: 27px;}
	#search ul button {position: absolute; right: 12px; top: 5px; border: none; background: none;}
	#search li {position: relative; padding: 0 25px 0 12px;}
	#search li:hover {background: #f3f3f3;}
	
	#save {border-top: 1px #d2af8a solid; color: #d2af8a; font-size: 13px; padding: 10px;}
	#save img {position: absolute;}
	#save button {border: none; background: none; color: #d2af8a; font-size: 13px; }
	#save button img {width: 36px; bottom: 1px; left: 85px;}
	#save > img {width: 15px; right: 10px; cursor: pointer;}

	#visit {margin: 0 auto; width: 930px; border: 1px solid gainsboro; padding: 10px; font-size: 12px; color: #d2af8a; font-weight: bold; background-color: rgb(240, 240, 240);}
    #visit img {height: 8px; cursor: pointer;}
    #visit button {background-color: white; padding: 0 4px; border: 1px solid gainsboro; margin: 0 5px; cursor: pointer;}
    #visit li,#visit ul {display: inline;}
    #visit a {color: black; font-weight: normal;}
    #visit ul img {margin: 0 10px; height: 7px; cursor: pointer;}
    #visit ul {margin-left: 5px;}
    
    #empty {font-size: 12px; color: #999; text-align: center; padding: 100px 0;}
    #top {
	    width: 950px;
	    margin: 0 auto;
    }
    
    .right {float: right;}
	.left {float: left;}
	.main_color {color: #d2af8a;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	if(sessionStorage.getItem("save") == "on") {
		$("#save button img").attr("src","image/switch.png")
	}
	else if(sessionStorage.getItem("save") == "off") {
		$("#save button img").attr("src","image/switch3.png")
	}
		
	$(function() {
		$("#search input").on("click", function() {
			if($("#save button img").attr("src") === "image/switch.png")
	    		$("#search > div").show()
	    });
	    
	    $("#save > img").on("click", function() {
	    	$("#search > div").hide()
	    });
	    
	    $("#search input").on("keyup", function() {
	    	if($("#search input").val())
	    		$("#search > div").show()
	    	else
		    	$("#search > div").hide()
	    });
	});
	
	function check() {
		if($("#save button img").attr("src") === "image/switch.png") {
			if(confirm("검색어 저장 기능을 중지하시겠습니까?")) {
				$("#search > div").hide()
				$("#save button img").attr("src","image/switch3.png")
				$("#search input[name=save]").attr("value","off")
				location.href="searchSave.jsp?save=off"
			}
		}
		else {
			if(confirm("검색어 저장 기능을 사용하시겠습니까?")) {
				$("#search > div").show()
				$("#save button img").attr("src","image/switch.png")
				$("#search input[name=save]").attr("value","on")
				location.href="searchSave.jsp?save=on"
			}
		}
	}
	
	function delCheck() {
		if(confirm("검색 목록을 모두 삭제하시겠습니까?"))
			location.href='delSearch.jsp?del=all'
	}
</script>
<header>
	<div id=top>
		<h1><a href=main.jsp>minami.com</a></h1>
		<div id=search>
			<form action="search.jsp" autocomplete="off">
				<input type=text placeholder="게시판 & 통합검색" name="word" value=<%= word %>>
				<input type=hidden value=<%=save%> name=save>
				<button><img src="image/search2.png"></button>
			</form>
			<div>
				<div>
					<h5>최근 검색어<button onclick=delCheck()>전체 삭제</button></h5>
					<%
						if(sList.size() == 0) {
							%><div id=empty>최근 검색어가 없습니다.</div><%
						}
						else {
							%><ul><%
							for(int i = sList.size()-1; i >= 0; i--) {
								%><li><a href="search.jsp?word=<%= sList.get(i).getWord() %>&save=<%=save%>"><%=sList.get(i).getWord() %></a>
									<button onclick="location.href='delSearch.jsp?idx=<%=sList.get(i).getIdx()%>'"><img src=image/x1.png></button><%
							}
							%></ul><%
						}
					%>
				</div>
				<div id=save>
					<button onclick=check()><b>검색어 저장</b>
					<%
						if(save.equals("on")) {
							%><img src=image/switch.png><%
						}
						else {
							%><img src=image/switch3.png><%
						}
					%></button>
					<img src=image/close2.png>
				</div>
			</div>
		</div>
	</div>
	<nav>
		<ul>
			<li><a href=#>메인</a>
			<li><a href=minor.jsp id=a_minor>마이너</a>
			<li><a href=#>미니</a>
			<li>|
			<li><a href=#>블로그</a>
			<li><a href=#>뉴스</a>
			<li><a href=#>게임</a>
			<li><a href=#>위키</a>
			<li><a href=#>이벤트</a>
			<li><a href=#>이모티콘</a>
		</ul>
	</nav>
	<div id=visit>
		최근 방문
        <button><img src="image/drop-down-arrow2.png"></button>
        <img src="image/left.png">
        <ul>
        <%
        	if (viList != null) {
        		for (int i = viList.size()-1; i >= 0; i--) {
        			int index = GallListDao.getInstance().selectIdx(viList.get(i));
            		%><li><a href="gallMain.jsp?idx=<%=index %>"><%= viList.get(i) %></a>
            		<%
            			if (request.getQueryString() == null) {
            				%><img src="image/x1.png" onclick="location.href='delVisit.jsp?gall=<%= viList.get(i) %>&url=<%=request.getRequestURL()%>'"><%
            			}
            			else {
            				%><img src="image/x1.png" onclick="location.href='delVisit.jsp?gall=<%= viList.get(i) %>&url=<%=request.getRequestURL()+"?"+request.getQueryString() %>'"><%
            			}
            	}
        	}
        %>
        </ul>
        <div class="right"><img src="image/right-arrow.png"><a href="#">전체</a></div>
	 </div>
</header>
<script>
	if(document.location.href.indexOf("minor.jsp") != -1)
		$("#a_minor").css("color", "#ffed44")
</script>